import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  RxBool isLoading = false.obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  onSignInPressed() async {
    isLoading.value = true;
    update();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
  }
}
