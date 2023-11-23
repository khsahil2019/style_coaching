import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:style_coaching/Screens/AuthScreens/signin.dart';
import 'package:style_coaching/Screens/HomePage/home.dart';
import 'package:style_coaching/Screens/HomePage/homeScreen.dart';
import 'package:style_coaching/Screens/UserRegistration/property.dart';
import 'package:style_coaching/Screens/UserRegistration/trainee.dart';
import 'package:style_coaching/Screens/UserRegistration/trainer.dart';
import 'package:style_coaching/Screens/UserRegistration/userChoice.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay using Future.delayed to display the splash screen for a few seconds
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the next screen after the splash screen duration
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              UserChoiceScreen(), // Replace 'NextScreen' with your main screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the splash screen covers the entire screen using Scaffold
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light, // Status bar color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Your splash screen content (e.g., logo)
              Image.asset('assets/google.png', width: 150, height: 150),
              SizedBox(height: 20),
              Text(
                'Sports Buddy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
