import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_coaching/Screens/AuthScreens/signin.dart';
import 'package:style_coaching/Screens/AuthScreens/signup.dart';
import 'package:style_coaching/Screens/HomePage/home.dart';
import 'package:style_coaching/Screens/ProfileScreens/editProfile.dart';
import 'package:style_coaching/Screens/ProfileScreens/profile.dart';
import 'package:style_coaching/Screens/SplashScreens/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}
