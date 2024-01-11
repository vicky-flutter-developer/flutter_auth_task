import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      getLoggedInStatus();
    });
    super.onInit();
  }

  getLoggedInStatus() async {
    bool isLoggedIn = await AppPreferences.isLoggedIn();
    if (isLoggedIn) {
      Get.offAllNamed(Routes.homeScreen);
    } else {
      Get.offAllNamed(Routes.signInScreen);
    }
  }
}
