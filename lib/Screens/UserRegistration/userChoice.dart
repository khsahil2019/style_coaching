import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style_coaching/Helper/snackBar.dart';
import 'package:style_coaching/Screens/UserRegistration/property.dart';
import 'package:style_coaching/Screens/UserRegistration/trainee.dart';
import 'package:style_coaching/Screens/UserRegistration/trainer.dart';
import 'package:style_coaching/Widgets/button.dart';
import 'package:style_coaching/Widgets/dropDown.dart';

class UserChoiceScreen extends StatefulWidget {
  @override
  _UserChoiceScreenState createState() => _UserChoiceScreenState();
}

class _UserChoiceScreenState extends State<UserChoiceScreen> {
  String? _selectedUser;

  String _selectedValue = 'Choose User Type';
  List<String> _userList = [
    'Sports Coach',
    'Trainee',
    'Property Manager'
  ]; // Add your user types here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Register yourself as",
              style: GoogleFonts.aBeeZee(fontSize: 32, color: Colors.purple)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 300,
                child: CustomDropdown(
                  heading: "",
                  subHeading: "user type",
                  options: _userList,
                  selectedValue: _selectedUser,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedUser = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'Next',
            onPressed: () {
              if (_selectedUser != null) {
                if (_selectedUser == "Sports Coach") {
                  Get.to(() => TrainerRegisterScreen(),
                      arguments: _selectedUser);
                }
                if (_selectedUser == "Trainee") {
                  Get.to(() => TraineeScreen(), arguments: _selectedUser);
                }
                if (_selectedUser == "Property Manager") {
                  Get.to(() => PropertyScreen(), arguments: _selectedUser);
                }
              } else {
                showSnakbar("Please Select user type", "");
              }

              print('Button pressed!');
            },
            buttonColor: Colors.purple, // Custom button color
            textColor: Colors.white, // Custom text color
            borderRadius: 25,
            buttonWidth: 200, // Custom border radius
            font: FontWeight.bold, // Custom font weight
          ),
        ],
      ),
    );
  }
}
