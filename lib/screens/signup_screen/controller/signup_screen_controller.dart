import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/authentication_helper/authentication_helper.dart';

class SignUpScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  RxBool isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  onSignUpPressed() async {
    // isLoading.value = true;
    // update();
    await AuthenticationHelper()
        .signUp(email: emailController.text, password: passwordController.text)
        .then((result) {
      if (result == null) {
      } else {
        print(_auth.currentUser?.email);
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
  }
}
