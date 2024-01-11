import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/custom_widgets/custom_authentication_ui.dart';
import '../../../utils/validator/validations.dart';
import '../controller/sign_in_screen_controller.dart';

class SignInScreenView extends GetView<SignInScreenController> {
  const SignInScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
            child: Form(
          key: controller.signInFormKey,
          autovalidateMode: controller.autoValidateMode,
          child: CustomAuthenticationUi(
            isSignIn: true,
            emailController: controller.emailController,
            passwordController: controller.passwordController,
            isPasswordVisible: controller.isPasswordVisible.value,
            titleText: 'Sign In',
            emailValidator: (value) {
              if (!isEmail(value!)) {
                return "Please enter a valid email";
              }
              return null;
            },
            passwordValidator: (value) =>
                value!.isEmpty ? "Please enter password" : null,
            onButtonPressed: () {
              if (controller.signInFormKey.currentState!.validate()) {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.onSignInPressed();
              } else {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.autoValidateMode = AutovalidateMode.always;
                controller.update();
              }
            },
            onTextPressed: () {
              Get.toNamed(Routes.signUpScreen);
            },
            onIconPressed: () {
              controller.onGoogleSignInClicked();
            },
            onSuffixIconPressed: () {
              controller.onPasswordIconClicked();
            },
            isLoader: controller.isLoading.value,
          ),
        )),
      ),
    );
  }
}
