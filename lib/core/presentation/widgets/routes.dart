import 'package:flutter/material.dart';
import 'package:ride_uber/src/home/presentation/pages/home_page.dart';
import 'package:ride_uber/src/login/presentation/pages/login_page.dart';
import 'package:ride_uber/src/signup/presentation/pages/sign_up_page.dart';

class Routes {
  // Navigation routes
  static const String home = '/home';
  static const String signup = '/signup';
  static const String login = '/login';

  /*
  Routes for main.dart
   */
  static final Map<String, WidgetBuilder> routes = {
    Routes.home: (BuildContext context) => HomePage(),
    Routes.signup: (BuildContext context) => SignUpPage(),
    Routes.login: (BuildContext context) => LoginPage()
  };
}
