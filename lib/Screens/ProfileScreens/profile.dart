import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:style_coaching/Screens/ProfileScreens/editProfile.dart';

class ProfileScreen extends StatelessWidget {
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
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                          radius: 60,
                          backgroundImage: AssetImage(
                              'assets/profile_image.jpg'), // Replace with your image
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
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Sahil khan', // Replace with the user's name
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildSection(
              title: 'Account',
              items: [
                buildProfileItem(
                    title: 'Edit Profile',
                    icon: Icons.edit,
                    onTap: () {
                      Get.to(() => EditProfileScreen());
                    }),
                buildProfileItem(
                    title: 'Notification',
                    icon: Icons.notifications,
                    onTap: () {}),
                buildProfileItem(
                    title: 'Privacy', icon: Icons.lock, onTap: () {}),
              ],
            ),
            const Divider(),
            buildSection(
              title: 'Support & About',
              items: [
                buildProfileItem(
                    title: 'Dark Mode',
                    icon: Icons.nightlight_round,
                    onTap: () {}),
                buildProfileItem(
                    title: 'Help & Support', icon: Icons.help, onTap: () {}),
                buildProfileItem(
                    title: 'Terms and Conditions',
                    icon: Icons.description,
                    onTap: () {}),
              ],
            ),
            const Divider(),
            buildSection(
              title: 'Actions',
              items: [
                buildProfileItem(
                    title: 'Report a Problem',
                    icon: Icons.report,
                    onTap: () {}),
                buildProfileItem(
                    title: 'Invite Friends',
                    icon: Icons.group_add,
                    onTap: () {}),
                buildProfileItem(
                    title: 'Logout', icon: Icons.logout, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(children: items),
      ],
    );
  }

  Widget buildProfileItem(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  // Widget buildProfileItem(
  //     {required String title,
  //     required IconData icon,
  //     required VoidCallback onTap}) {
  //   return ListTile(
  //     title: Text(title),
  //     onTap: onTap,
  //   );
  // }
}
