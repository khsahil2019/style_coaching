import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:style_coaching/Widgets/dobPicker.dart';
import 'package:style_coaching/Widgets/dropDown.dart';

import 'package:style_coaching/Widgets/textField.dart';

class TraineeScreen extends StatefulWidget {
  TraineeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TraineeScreenState createState() => _TraineeScreenState();
}

var data = Get.arguments;

class _TraineeScreenState extends State<TraineeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isPreferredSports = false;
  List<bool> isPreferredSportList = List.filled(29, false);
  List selectedPreferredSport = [];
  List PreferredList = [
    'Football',
    'Basketball',
    'Tennis',
    'Swimming',
    'Others'
  ];
  String? _selectedLevel;
  final List<String> _levelList = ['Beginner', 'Intermediate', 'Advanced'];
  final TextEditingController _aimController = TextEditingController();

  String? _selectedGender;
  String? _selectedUser;

  final List<String> _gendersList = ['Male', 'Female', 'Other'];
  final List<String> _userList = ['Trainer', 'Trainee', 'PlaceHolder'];

  File? _imageFile;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set back button color to white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(data),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          backgroundImage: AssetImage(
                              'assets/google.png'), // Replace with your image
                        ),
                        GestureDetector(
                          onTap: () {
                            _getImage();
                            // Handle edit profile photo functionality
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomDropdown(
                  //   heading: 'Registering youself As?',
                  //   subHeading: "Select User Type",
                  //   options: _userList,
                  //   selectedValue:
                  //       _selectedUser, // Set your initial selected value
                  //   onChanged: (String? value) {
                  //     setState(() {
                  //       _selectedUser = value;
                  //     });
                  //   },
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Full Name",
                      hint: "Enter the Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController),
                  TextWidget(
                      heading: "Email",
                      hint: "Enter email",
                      keyboardType: TextInputType.name,
                      controller: _emailController),
                  TextWidget(
                      heading: "Contact Number",
                      hint: "Enter contact No",
                      keyboardType: TextInputType.name,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Address",
                      hint: "Enter Address",
                      keyboardType: TextInputType.name,
                      controller: _addressController),
                  DatePickerField(
                    controller: _dobController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdown(
                    heading: 'Gender', subHeading: "Select Gender",
                    options: _gendersList,
                    selectedValue:
                        _selectedGender, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Preferred Sport(s) for Learning",
                        style: TextStyle(color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPreferredSports = !_isPreferredSports;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          selectedPreferredSport.isEmpty
                                              ? "Select Preferred Sport(s) for Learning"
                                              : "You are Selected ${selectedPreferredSport.length} Preferred Sports",
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isPreferredSports)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: PreferredList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(PreferredList[index]),
                                value: isPreferredSportList[index],
                                selected: isPreferredSportList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedPreferredSport
                                          .contains(PreferredList[index])) {
                                        selectedPreferredSport
                                            .add(PreferredList[index]);
                                      }
                                    } else {
                                      if (selectedPreferredSport
                                          .contains(PreferredList[index])) {
                                        selectedPreferredSport
                                            .remove(PreferredList[index]);
                                      }
                                    }
                                    isPreferredSportList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdown(
                    heading: 'Skill Level', subHeading: "Select Level",
                    options: _levelList,
                    selectedValue:
                        _selectedLevel, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLevel = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Goals or Objectives for Learning the Sport",
                      hint: "Enter Goals or Objectives for Learning the Sport",
                      keyboardType: TextInputType.name,
                      controller: _aimController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          // ApiService().registerUser(
                          //     _nameController.text,
                          //     _emailController.text,
                          //     _mobileController.text,
                          //     _addressController.text,
                          //     selectedSpecialization.toString(),
                          //     _currentSliderValue.toString(),
                          //     _dobController.text,
                          //     _countryName.toString(),
                          //     _selectedGender.toString(),
                          //     _selectedTargetGender.toString(),
                          //     _daysAvailability.toString(),
                          //     _selectedStartTime.toString(),
                          //     _selectedEndTime.toString(),
                          //     _ageGroups.toString(),
                          //     _extraController.text,
                          //     _skillController.text,
                          //     _stateController.text,
                          //     _cityController.text,
                          //     _areaController.text,
                          //     providePickAndDrop.toString(),
                          //     _chargesController.text,
                          //     _pincodeController.text,
                          //     DateTime.now());
                          // // Get.offAll(() => ProfileScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
