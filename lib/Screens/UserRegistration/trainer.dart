import 'dart:io';

import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:style_coaching/Services/apiService.dart';

import 'package:style_coaching/Widgets/countryList.dart';
import 'package:style_coaching/Widgets/dobPicker.dart';
import 'package:style_coaching/Widgets/dropDown.dart';

import 'package:style_coaching/Widgets/slider.dart';
import 'package:style_coaching/Widgets/textField.dart';

class TrainerRegisterScreen extends StatefulWidget {
  @override
  _TrainerRegisterScreenState createState() => _TrainerRegisterScreenState();
}

class _TrainerRegisterScreenState extends State<TrainerRegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _chargesController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();
  String? _selectedGender;
  String? _selectedUser;
  String? _countryName;

  String? _selectedTargetGender;
  // String? _selectedSpecialization;
  double _currentSliderValue = 0;
  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  final List<String> _gendersList = ['Male', 'Female', 'Other'];
  final List<String> _userList = ['Trainer', 'Trainee', 'PlaceHolder'];

  final Map<String, bool> _ageGroups = {
    'Kids (6-12)': false,
    'Teenagers (13-18)': false,
    'Young Adults (19-30)': false,
    'Adults (31-50)': false,
    'Seniors (50+)': false,
  };
  final Map<String, bool> _daysAvailability = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };
  List SpecializationList = [
    'Football',
    'Basketball',
    'Tennis',
    'Swimming',
    'Others'
  ];
  bool _isExpanded = false;

  List<bool> isSpecializationList = List.filled(29, false);

  List selectedSpecialization = [];
  TimeOfDay _selectedStartTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _selectedEndTime = TimeOfDay(hour: 18, minute: 0);
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
        title: const Text('Profile Registration'),
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
                  CountryPickerWidget(
                    onChanged: (CountryCode? code) {
                      _countryName = code?.name;
                      print(_countryName);
                      // Handle the selected country code or name
                      if (code != null) {
                        print('Selected country: ${code.name}');
                        print('Country code: ${code.dialCode}');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "State",
                      hint: "Enter State",
                      keyboardType: TextInputType.name,
                      controller: _stateController),
                  TextWidget(
                      heading: "City",
                      hint: "Enter City",
                      keyboardType: TextInputType.name,
                      controller: _cityController),
                  TextWidget(
                      heading: "Landmark of your Area",
                      hint: "Enter Area",
                      keyboardType: TextInputType.name,
                      controller: _areaController),
                  TextWidget(
                      heading: "Pincode",
                      hint: "Enter Pincode",
                      keyboardType: TextInputType.name,
                      controller: _pincodeController),
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
                  CustomDropdown(
                    heading: 'Registering youself As?',
                    subHeading: "Select User Type",
                    options: _userList,
                    selectedValue:
                        _selectedUser, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedUser = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _selectedUser == "Trainer"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sports Specialization",
                              style: TextStyle(color: Colors.purple),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                selectedSpecialization.isEmpty
                                                    ? "Sports Specialization"
                                                    : "You are Selected ${selectedSpecialization.length} Sports Specialization",
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Icon(
                                                    Icons.arrow_drop_down)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_isExpanded)
                              AnimatedContainer(
                                //width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                duration: Duration(milliseconds: 300),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: SpecializationList.length,
                                  itemBuilder: (context, index) {
                                    return CheckboxListTile(
                                      autofocus: true,
                                      checkColor: Colors.white,
                                      title: Text(SpecializationList[index]),
                                      value: isSpecializationList[index],
                                      selected: isSpecializationList[index],
                                      dense: true,
                                      onChanged: (value) {
                                        setState(() {
                                          if (value!) {
                                            if (!selectedSpecialization
                                                .contains(SpecializationList[
                                                    index])) {
                                              selectedSpecialization.add(
                                                  SpecializationList[index]);
                                            }
                                          } else {
                                            if (selectedSpecialization.contains(
                                                SpecializationList[index])) {
                                              selectedSpecialization.remove(
                                                  SpecializationList[index]);
                                            }
                                          }
                                          isSpecializationList[index] = value;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                          ],
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  _selectedUser == "Trainer"
                      ? CustomSlider(
                          minValue: 0,
                          maxValue: 100,
                          divisions: 10,
                          label: 'Experince Level',
                          onChanged: (double value) {
                            _currentSliderValue = value;
                            // Do something with the value when it changes
                            print(
                                'Selected level: ${_currentSliderValue.round()}');
                          },
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  _selectedUser == "Trainer"
                      ? CustomDropdown(
                          heading:
                              'Preferred gender for training (Male/Female)',
                          subHeading: "Select Gender",
                          options: _gendersList,
                          selectedValue:
                              _selectedTargetGender, // Set your initial selected value
                          onChanged: (String? value) {
                            setState(() {
                              _selectedTargetGender = value;
                            });
                          },
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  _selectedUser == "Trainer"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Set your Availability Schedule',
                              style: TextStyle(color: Colors.purple),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Switch(
                                  value: availibilty,
                                  onChanged: (newValue) {
                                    setState(() {
                                      availibilty = newValue;
                                    });
                                  },
                                ),
                                Text(availibilty
                                    ? 'Now Set your Availability Schedule'
                                    : 'Slide to Set your Availability Schedule'),
                              ],
                            ),
                            availibilty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      // Display checkboxes for days
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: _daysAvailability.keys
                                            .map((String day) {
                                          return CheckboxListTile(
                                            title: Text(day),
                                            value: _daysAvailability[day],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _daysAvailability[day] =
                                                    value ?? false;
                                              });
                                            },
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(height: 12),
                                      // Select start and end timings
                                      Row(
                                        children: [
                                          Text('Start Time: '),
                                          TextButton(
                                            onPressed: () async {
                                              TimeOfDay? selectedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: _selectedStartTime,
                                              );
                                              if (selectedTime != null) {
                                                setState(() {
                                                  _selectedStartTime =
                                                      selectedTime;
                                                });
                                              }
                                            },
                                            child: Text(_selectedStartTime
                                                .format(context)),
                                          ),
                                          SizedBox(width: 20),
                                          Text('End Time: '),
                                          TextButton(
                                            onPressed: () async {
                                              TimeOfDay? selectedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: _selectedEndTime,
                                              );
                                              if (selectedTime != null) {
                                                setState(() {
                                                  _selectedEndTime =
                                                      selectedTime;
                                                });
                                              }
                                            },
                                            child: Text(_selectedEndTime
                                                .format(context)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : SizedBox(),
                  _selectedUser == "Trainer"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Preferred Age Group to teach',
                              style: TextStyle(color: Colors.purple),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Switch(
                                  value: ageGroup,
                                  onChanged: (newValue) {
                                    setState(() {
                                      ageGroup = newValue;
                                    });
                                  },
                                ),
                                Text(ageGroup
                                    ? 'Select Preferred Age Group to teach'
                                    : 'Slide to Set Preferred Age Group to teach'),
                              ],
                            ),
                            ageGroup
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        _ageGroups.keys.map((String ageGroup) {
                                      return CheckboxListTile(
                                        title: Text(ageGroup),
                                        value: _ageGroups[ageGroup],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _ageGroups[ageGroup] =
                                                value ?? false;
                                          });
                                        },
                                      );
                                    }).toList(),
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Something extra ordinary",
                      hint: "Enter Something extra ordinary",
                      keyboardType: TextInputType.name,
                      controller: _extraController),
                  TextWidget(
                      heading: "Specific Skills or Techniques Taught",
                      hint: "Enter Specific Skills",
                      keyboardType: TextInputType.name,
                      controller: _skillController),
                  const Text(
                    'Do you provide pick and drop facility?',
                    style: TextStyle(color: Colors.purple),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Switch(
                        value: providePickAndDrop,
                        onChanged: (newValue) {
                          setState(() {
                            providePickAndDrop = newValue;
                          });
                        },
                      ),
                      Text(providePickAndDrop
                          ? 'Providing Pick and Drop'
                          : 'Not Providing Pick and Drop'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Charges per Hours",
                      hint: "Enter Charges",
                      keyboardType: TextInputType.number,
                      controller: _chargesController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          ApiService().registerUser(
                              _nameController.text,
                              _emailController.text,
                              _mobileController.text,
                              _addressController.text,
                              selectedSpecialization.toString(),
                              _currentSliderValue.toString(),
                              _dobController.text,
                              _countryName.toString(),
                              _selectedGender.toString(),
                              _selectedTargetGender.toString(),
                              _daysAvailability.toString(),
                              _selectedStartTime.toString(),
                              _selectedEndTime.toString(),
                              _ageGroups.toString(),
                              _extraController.text,
                              _skillController.text,
                              _stateController.text,
                              _cityController.text,
                              _areaController.text,
                              providePickAndDrop.toString(),
                              _chargesController.text,
                              _pincodeController.text,
                              DateTime.now());
                          // Get.offAll(() => ProfileScreen());
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
