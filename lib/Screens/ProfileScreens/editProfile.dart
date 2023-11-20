import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:style_coaching/Screens/ProfileScreens/profile.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  String _selectedGender = '';
  // Add more controllers for other fields if needed

  List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy')
            .format(picked); // Format as per your requirement
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
        title: Text('Edit Profile'),
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Email'),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Date of Birth'),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Text(""),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Select your date of birth',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Country'),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      hintText: 'Select your country',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.flag,
                        color: Colors.purple,
                      ), // Placeholder for flag icon
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Gender'),
                  SizedBox(height: 8),
                  DropdownButtonFormField(
                    value: _selectedGender.isNotEmpty ? _selectedGender : null,
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Select your gender',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          // handle login logic
                          // Get.to(() => ProfileScreen());
                          Get.offAll(() => ProfileScreen());
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
                            'Save Changes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    // Implement logic to save changes
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newDob = _dobController.text;
    String newCountry = _countryController.text;
    String newGender = _selectedGender;

    // Process updated details, update database, etc.

    // After saving changes, navigate back to the ProfileScreen or the previous screen
    Navigator.pop(context);
  }
}
