import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_uber/core/data/static_data.dart';
import 'package:ride_uber/core/presentation/widgets/LoadingDialog.dart';
import 'package:ride_uber/core/presentation/widgets/brand_colors.dart';
import 'package:ride_uber/core/presentation/widgets/routes.dart';
import 'package:ride_uber/core/presentation/widgets/taxi_btn.dart';
import 'package:ride_uber/injection_container.dart';
import 'package:ride_uber/src/login/presentation/bloc/login_bloc.dart';
import 'package:ride_uber/src/signup/presentation/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _bloc = sl<LoginBloc>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //UserCredential userCredential;
  //DatabaseReference databaseReference;

  // void loginUser(String email, String password) async {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => LoadingDialog(
  //             status: 'Logging you in!',
  //           ));

  //   try {
  //     userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     print('User HERE: ${userCredential.user}');
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case 'user-not-found':
  //         showSnackBar('USER NOT FOUND');
  //         Navigator.of(context).pop();
  //         break;
  //       case 'wrong-password':
  //         showSnackBar('INVALID PASSWORD');
  //         Navigator.of(context).pop();
  //         break;
  //       default:
  //         Navigator.of(context).pop();
  //         break;
  //     }
  //   } catch (e) {
  //     PlatformException platformException = e;
  //     showSnackBar(platformException.message);
  //   } finally {
  //     if (userCredential.user != null) {
  //       databaseReference = FirebaseDatabase.instance
  //           .reference()
  //           .child('users/${userCredential.user.uid}');

  //       databaseReference.once().then((DataSnapshot snapshot) {
  //         if (snapshot.value != null) {
  //           print('DB SNAP: ${snapshot.value}');
  //           // push
  //           Navigator.of(context)
  //               .pushNamedAndRemoveUntil('/home', (route) => false);
  //         }
  //       });
  //     }
  //   }
  // }

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
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Image.asset(Images.logo,
                        //alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Ride with ride Uber',
                      style: TextStyle(fontFamily: 'Fira-Bold', fontSize: 18.0),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email address',
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                            color: BrandColors.colorLightGray, fontSize: 10.0)),
                  ),
                  TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                              color: BrandColors.colorLightGray,
                              fontSize: 10.0))),
                  Padding(
                    padding: const EdgeInsets.only(top: 34.0),
                    child: TaxiBtn(
                      onPressed: () => {print('hey')},
                      backColor: BrandColors.colorGreen,
                      title: 'LOGIN',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.signup);
                      },
                      child: Text(
                        'Not a user?, Sign up here!',
                        style:
                            TextStyle(fontFamily: 'Fira-Bold', fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
