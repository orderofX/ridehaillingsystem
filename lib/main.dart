import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_uber/core/presentation/widgets/brand_colors.dart';
import 'package:ride_uber/src/home/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'package:ride_uber/src/login/presentation/pages/login_page.dart';
import 'package:ride_uber/core/presentation/widgets/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (Firebase.apps.length == 0)
    await Firebase.initializeApp(
        name: 'ride-uber',
        options: Platform.isIOS
            ? FirebaseOptions(
                appId: '',
                apiKey: 'AIzaSyAAaT-Vl8QDBk-JoxYQ9sG2GIF7Z5S9tm0',
                projectId: 'ride-uber',
                messagingSenderId: '213750194417',
                databaseURL: 'https://ride-uber.firebaseio.com')
            : FirebaseOptions(
                appId: '1:213750194417:android:84eef140c230c224db0950',
                apiKey: 'AIzaSyAAaT-Vl8QDBk-JoxYQ9sG2GIF7Z5S9tm0',
                projectId: 'ride-uber',
                messagingSenderId: '213750194417',
                databaseURL: 'https://ride-uber.firebaseio.com'));
  else
    Firebase.app();
  runApp(MaterialApp(
    routes: Routes.routes,
    home: LoginPage(),
    title: 'Ride Uber',
    theme: ThemeData(
        fontFamily: 'Fira-Bold',
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity),
  ));
}
