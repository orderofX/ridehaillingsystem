import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_uber/core/data/static_data.dart';
import 'package:ride_uber/core/presentation/widgets/LoadingDialog.dart';
import 'package:ride_uber/core/presentation/widgets/brand_colors.dart';
import 'package:ride_uber/core/presentation/widgets/routes.dart';
import 'package:ride_uber/core/presentation/widgets/taxi_btn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //final _bloc = sl<SignUpBloc>();

  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();
  
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  DatabaseReference dbRef;
  UserCredential userCredential;

  void registerUser(String email, String password) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => LoadingDialog(
              status: 'Getting you Registered',
            ));

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          showSnackBar('Email Already exists');
          Navigator.of(context).pop();
          break;
        case 'weak-password':
          showSnackBar('Provide a stronger password');
          Navigator.of(context).pop();
          break;
        case 'invalid-email':
          showSnackBar('Incorrect Email');
          Navigator.of(context).pop();
          break;
        default:
          showSnackBar(e.code);
          Navigator.of(context).pop();
          break;
      }
    } catch (e) {
      PlatformException platformException = e;
      showSnackBar(platformException.message);
    } finally {
      if (userCredential.user != null) {
        dbRef = FirebaseDatabase.instance
            .reference()
            .child('users/${userCredential.user.uid}');

        Map<String, String> user = {
          'fullname': fullNameController.text,
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text
        };
        dbRef.set(user);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }
    }
  }

  void showSnackBar(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ));

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: BrandColors.colorBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: Image.asset(Images.logo,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.4)),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Create a Rider\'s account',
                        style:
                            TextStyle(fontFamily: 'Fira-Bold', fontSize: 18.0),
                      ),
                    ),
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                              color: BrandColors.colorLightGray,
                              fontSize: 10.0)),
                    ),
                    TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email address',
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                                color: BrandColors.colorLightGray,
                                fontSize: 10.0))),
                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: 'Phone number',
                          hintStyle: TextStyle(
                              color: BrandColors.colorLightGray,
                              fontSize: 10.0)),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: 'Password',
                          hintStyle: TextStyle(
                              color: BrandColors.colorLightGray,
                              fontSize: 10.0)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 34.0),
                        child: TaxiBtn(
                          backColor: BrandColors.colorGreen,
                          title: 'REGISTER',
                          onPressed: () => {},
                        )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.login);
                        },
                        child: Text('Already a rider?, login here!'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
