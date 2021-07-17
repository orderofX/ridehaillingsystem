import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:ride_uber/core/user/data/models/user_model.dart';

abstract class LoginRemoteDB {
  Future<UserModel> loginUser({@required email, @required password});
}

class LoginRemoteDBImpl implements LoginRemoteDB {
  UserCredential userCredential;
  DatabaseReference databaseReference;
  bool loggedIn = false;
  Map<dynamic, dynamic> dbsnap = new Map();

  @override
  Future<UserModel> loginUser({email, password}) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        print('USER LOGGED IN');
        databaseReference = FirebaseDatabase.instance
            .reference()
            .child('users/${userCredential.user.uid}');
        databaseReference.once().then((DataSnapshot snapshot) {
          if (snapshot.value != null) {
            print('Snapshot TYPE:: ${snapshot.value.runtimeType}');
            dbsnap = snapshot.value;
          }
        });
      } else {
        print('>>>>>>>>>LOG IN ERROR<<<<<<<<<<<');
      }
    } on FirebaseAuthException catch (e) {
      print('AUTH ERROR ${e.message}');
    } finally {
      print('SNAPPED $dbsnap');
      return UserModel.fromJson(dbsnap);
    }
  }
}
