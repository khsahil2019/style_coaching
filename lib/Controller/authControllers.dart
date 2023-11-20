import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

AuthController authController = AuthController.instance;
// FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Map? user;
  List<dynamic> exoticplaceList = [];
  List<dynamic> destinationWeddingList = [];
  List<dynamic> dealsList = [];
  List<dynamic> reviewList = [];
  Map? indexPageList;
  Map? logoList;
  Map? privacyList;
  // Map? reviewList;
  //Map? reviewList;
// Map? fulldata;
  @override
  void onInit() {
    // TODO: implement onInit
    // getLogout();
    // deleteAccount();
    // getPrivacy();
    // getExoticpalce();
    // getIndexPage();
    // getDestinationWeeding();
    // getDeals();
    // getlogo();
    // getReview();
    super.onInit();
    log("AuthController onInit");
  }

  // getPrivacy() {
  //   ApiService().privacyPolicy().then((value) => privacyList = value);
  // }

  // getLogout() {
  //   ApiService().logout().then((value) => null);
  // }

  // getLogout2() {
  //   ApiService().logout2().then((value) => null);
  // }

  // deleteAccount() {
  //   ApiService().deleteAccount().then((value) => null);
  // }
  //  void signOut() async {
  //   ApiService.();
  // }
  // getReview() {
  //   ApiService().review().then((value) => reviewList = value);
  // }

  // }
}
