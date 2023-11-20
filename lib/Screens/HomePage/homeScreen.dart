import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:style_coaching/Screens/chat/chatScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/google.png'),
                  // Replace with profile picture
                ),
                IconButton(
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.purple,
                    size: 35,
                  ),
                  onPressed: () {
                    Get.to(() => ChatBody());
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  'Hello, Sahil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Add rest of the content
        ],
      ),
    );
  }
}
