import 'package:get/get.dart';
import '../controller/sign_in_screen_controller.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInScreenController());
  }
}
