import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_coaching/Helper/snackBar.dart';

import '../Helper/showLoading.dart';

class ApiService {
  BuildContext? get context => null;

  final baseUrl = "easyresearch.in";
  final baseUrl2 = "crux.center";
  final _header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map?> registerUser(
    String username,
    String email,
    String mobile,
    String address,
    String sportSpeciality,
    String expLevel,
    String dob,
    String country,
    String gender,
    String prefGender,
    String daySchedule,
    String timeSchedule,
    String endTimeSchedule,
    String ageGroup,
    String extra,
    String skills,
    String state,
    String city,
    String location,
    String pickUpDrop,
    String charges,
    String pincode,
    DateTime dateTime,
  ) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/coach_signup.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'name': username,
        'email': email,
        'number': mobile,
        'address': address,
        'sport_speciality': sportSpeciality,
        'exp_level': expLevel,
        'dob': dob,
        'country': country,
        'gender': gender,
        'pref_gender': prefGender,
        'day_schedule': daySchedule,
        'time_schedule': timeSchedule,
        'endTime_schedule': endTimeSchedule,
        'age_group': ageGroup,
        'extra': extra,
        'specific_skills': skills,
        'state': state,
        'city': city,
        'location': location,
        'pickdrop_facility': pickUpDrop,
        'charges_per_hour': charges,
        'pincode': pincode,
        'registration_date': dateTime.toIso8601String(),
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);

      log("response: " + _res.toString());

      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("Register successful");
          showSnakbar("Congratulation !", "Register successful");
          // authController.user = _res["data"];
          //  Get.offAll(LoginScreen());
          //Get.offAll(() => LoginScreen());
        } else {
          log("Something Wrong");
          showSnakbar("Try Again !", "Registration failed");
        }
      }

      // showBottomToast("Error", error.msg.toString());
      // showToastMessage(error.msg, Icons.error);

      // log("error: " + error.msg.toString());
      // return userdata;
      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return null;
    }
  }
}
