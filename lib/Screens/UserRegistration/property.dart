import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:style_coaching/Widgets/textField.dart';

class PropertyScreen extends StatefulWidget {
  @override
  _PropertyScreenState createState() => _PropertyScreenState();
}

var data = Get.arguments;

class _PropertyScreenState extends State<PropertyScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _propertyDescriptionController =
      TextEditingController();
  final TextEditingController _sizeOfPropertyController =
      TextEditingController();
  bool _isTypeOfProperty = false;
  final List<bool> _isTypeOfPropertyList = List.filled(29, false);
  List TypeOfPropertyList = [
    'Field,',
    'Court,',
    'Gym)',
    'Swimming',
  ];
  List selectedTypeOfProperty = [];
  // bool _isFacilities = false;
  // final List<bool> _isFacilitiesList = List.filled(29, false);
  // List FacilitiesList = [
  //   'lighting,',
  //   'equipment,',
  //   'seating)',
  // ];
  // List selectedFacilities = [];
  bool availibilty = false;
  final Map<String, bool> _daysAvailability = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  final TextEditingController _activityController = TextEditingController();
  bool _isAmenities = false;
  final List<bool> _isAmenitiesList = List.filled(29, false);
  List AmenitiesList = [
    'washroom for male',
    'washroom for female',
    'changing room',
  ];
  List selectedAmenities = [];
  bool _isSafety = false;
  final List<bool> _isSafetyList = List.filled(29, false);
  List SafetyList = [
    'gated',
    'CCTV',
    'Guard',
    'entry and exit register',
    'secured locker'
  ];
  List selectedSafety = [];
  bool providePickAndDrop = false;
  final TextEditingController _chargesController = TextEditingController();

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
                      controller: _fullNameController),
                  TextWidget(
                      heading: "Email",
                      hint: "Enter email",
                      keyboardType: TextInputType.name,
                      controller: _emailController),
                  TextWidget(
                      heading: "Address",
                      hint: "Enter Address",
                      keyboardType: TextInputType.name,
                      controller: _addressController),
                  TextWidget(
                      heading: "Contact Number",
                      hint: "Enter contact No",
                      keyboardType: TextInputType.name,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Property Description",
                      hint: "Enter Property Description",
                      keyboardType: TextInputType.name,
                      controller: _propertyDescriptionController),
                  TextWidget(
                      heading: "Size of the Property (in square meters/feet)",
                      hint: "Enter Property Address",
                      keyboardType: TextInputType.name,
                      controller: _sizeOfPropertyController),
                  const SizedBox(
                    height: 15,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type of Property",
                        style: TextStyle(color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTypeOfProperty = !_isTypeOfProperty;
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
                                          selectedTypeOfProperty.isEmpty
                                              ? "Type of Property"
                                              : "You are Selected ${selectedTypeOfProperty.length} Type of Property",
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
                      if (_isTypeOfProperty)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: TypeOfPropertyList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(TypeOfPropertyList[index]),
                                value: _isTypeOfPropertyList[index],
                                selected: _isTypeOfPropertyList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedTypeOfProperty.contains(
                                          TypeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .add(TypeOfPropertyList[index]);
                                      }
                                    } else {
                                      if (selectedTypeOfProperty.contains(
                                          TypeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .remove(TypeOfPropertyList[index]);
                                      }
                                    }
                                    _isTypeOfPropertyList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       "Preferred Sport(s) for Learning",
                  //       style: TextStyle(color: Colors.purple),
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           _isFacilities = !_isFacilities;
                  //         });
                  //       },
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(5),
                  //                 border: Border.all(color: Colors.grey),
                  //               ),
                  //               child: DropdownButtonHideUnderline(
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(4.0),
                  //                       child: Text(
                  //                         selectedFacilities.isEmpty
                  //                             ? "Select Preferred Sport(s) for Learning"
                  //                             : "You are Selected ${selectedFacilities.length} Preferred Sports",
                  //                       ),
                  //                     ),
                  //                     Container(
                  //                         margin: EdgeInsets.only(top: 20),
                  //                         child: const Icon(
                  //                             Icons.arrow_drop_down)),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     if (_isFacilities)
                  //       AnimatedContainer(
                  //         //width: 300,
                  //         height: 200,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.grey)),
                  //         duration: Duration(milliseconds: 300),
                  //         child: ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: ScrollPhysics(),
                  //           itemCount: FacilitiesList.length,
                  //           itemBuilder: (context, index) {
                  //             return CheckboxListTile(
                  //               autofocus: true,
                  //               checkColor: Colors.white,
                  //               title: Text(FacilitiesList[index]),
                  //               value: _isFacilitiesList[index],
                  //               selected: _isFacilitiesList[index],
                  //               dense: true,
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   if (value!) {
                  //                     if (!selectedFacilities
                  //                         .contains(FacilitiesList[index])) {
                  //                       selectedFacilities
                  //                           .add(FacilitiesList[index]);
                  //                     }
                  //                   } else {
                  //                     if (selectedFacilities
                  //                         .contains(FacilitiesList[index])) {
                  //                       selectedFacilities
                  //                           .remove(FacilitiesList[index]);
                  //                     }
                  //                   }
                  //                   _isFacilitiesList[index] = value;
                  //                 });
                  //               },
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                // Display checkboxes for days
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      _daysAvailability.keys.map((String day) {
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
                                            _selectedStartTime = selectedTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                          _selectedStartTime.format(context)),
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
                                            _selectedEndTime = selectedTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                          _selectedEndTime.format(context)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amenities or Facilities Available",
                        style: TextStyle(color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAmenities = !_isAmenities;
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
                                          selectedAmenities.isEmpty
                                              ? "Select Amenities or Facilities Available"
                                              : "You are Selected ${selectedAmenities.length} Amenities or Facilities Available",
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
                      if (_isAmenities)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: AmenitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(AmenitiesList[index]),
                                value: _isAmenitiesList[index],
                                selected: _isAmenitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAmenities
                                          .contains(AmenitiesList[index])) {
                                        selectedAmenities
                                            .add(AmenitiesList[index]);
                                      }
                                    } else {
                                      if (selectedAmenities
                                          .contains(AmenitiesList[index])) {
                                        selectedAmenities
                                            .remove(AmenitiesList[index]);
                                      }
                                    }
                                    _isAmenitiesList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Safety and security features",
                        style: TextStyle(color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSafety = !_isSafety;
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
                                          selectedSafety.isEmpty
                                              ? "Select Amenities or Facilities Available"
                                              : "You are Selected ${selectedSafety.length} Amenities or Facilities Available",
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
                      if (_isSafety)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: SafetyList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(SafetyList[index]),
                                value: _isSafetyList[index],
                                selected: _isSafetyList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedSafety
                                          .contains(SafetyList[index])) {
                                        selectedSafety.add(SafetyList[index]);
                                      }
                                    } else {
                                      if (selectedSafety
                                          .contains(SafetyList[index])) {
                                        selectedSafety
                                            .remove(SafetyList[index]);
                                      }
                                    }
                                    _isSafetyList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  TextWidget(
                      heading: "Preferred Sports or Activities Allowed",
                      hint: "Enter Preferred Sports",
                      keyboardType: TextInputType.number,
                      controller: _activityController),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),

                  TextWidget(
                      heading: "Charges per Hours",
                      hint: "Enter Charges",
                      keyboardType: TextInputType.number,
                      controller: _chargesController),
                  const SizedBox(height: 15),
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
