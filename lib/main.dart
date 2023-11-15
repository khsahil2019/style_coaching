import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_coaching/Screens/AuthScreens/signin.dart';

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
      home: signinScreen(),
    );
  }
}
