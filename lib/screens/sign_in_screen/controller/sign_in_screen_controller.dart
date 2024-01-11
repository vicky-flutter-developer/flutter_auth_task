import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../network/authentication_helper/authentication_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';

class SignInScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = true.obs;

  onPasswordIconClicked() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  onSignInPressed() async {
    isLoading.value = true;
    update();
    await AuthenticationHelper()
        .signIn(email: emailController.text, password: passwordController.text)
        .then((result) {
      if (result == "success") {
        AppPreferences.setLoggedIn(true);
        AppPreferences.setLoginType("email");
        Get.offAllNamed(Routes.homeScreen);
      } else {
        Get.snackbar(
          'Error',
          result,
          backgroundColor: Colors.grey[800],
          colorText: Colors.white,
          // duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
    isLoading.value = false;
    update();
  }

  onGoogleSignInClicked() async {
    final UserCredential userCredential =
        await AuthenticationHelper().googleAuthentication();
    isLoading.value = true;
    update();
    final User? user = userCredential.user;
    if (user != null) {
      AppPreferences.setLoggedIn(true);
      AppPreferences.setLoginType("gmail");
      AppPreferences.setUserEmail(user.email ?? "");
      AppPreferences.setAccountCreationTime(
          user.metadata.creationTime?.toLocal().toString() ?? "");
      AppPreferences.setLoginTime(
          user.metadata.lastSignInTime?.toLocal().toString() ?? "");
      AppPreferences.setProfileImage(user.photoURL ?? "");
      AppPreferences.setUserName(user.displayName ?? "");
      Get.offAllNamed(Routes.homeScreen);
    } else {
      Get.snackbar(
        'Error',
        "something went wrong, try again",
        backgroundColor: Colors.grey[800],
        colorText: Colors.white,
        // duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
    update();
  }
}
