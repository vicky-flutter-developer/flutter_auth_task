import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_task/utils/shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';

class HomeScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  RxString emailId = "".obs;
  RxString userName = "".obs;
  RxString profileUrl = "".obs;
  RxString accountCreationTime = "".obs;
  RxString loginTime = "".obs;
  RxString loginType = "".obs;
  RxBool isLoading = true.obs;
  RxBool isLogoutLoading = false.obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    loginType.value = await AppPreferences.getLoginType();
    emailId.value = await AppPreferences.getUserEmail();
    userName.value = await AppPreferences.getUserName();
    profileUrl.value = await AppPreferences.getProfileImage();
    accountCreationTime.value = await AppPreferences.getAccountCreationTime();
    loginTime.value = await AppPreferences.getLoginTime();
    isLoading.value = false;
    update();
  }

  String convertToNormalDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('d-MM-yyyy hh:mm:ss').format(dateTime);
  }

  onLogoutClicked() async {
    isLogoutLoading.value = true;
    update();
    if (loginType.value == "email") {
      await _auth.signOut().then((value) {
        AppPreferences.clearPreference();
        Get.offAllNamed(Routes.signInScreen);
      });
    } else {
      await _googleSignIn.signOut().then((value) {
        AppPreferences.clearPreference();
        Get.offAllNamed(Routes.signInScreen);
      });
    }
    isLogoutLoading.value = false;
    update();
  }
}
