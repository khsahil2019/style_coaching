import 'package:get/get.dart';
import 'package:style_coaching/Controller/authControllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
