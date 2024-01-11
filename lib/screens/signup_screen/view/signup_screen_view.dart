import 'package:flutter/material.dart';
import 'package:flutter_auth_task/screens/signup_screen/controller/signup_screen_controller.dart';
import 'package:get/get.dart';
import '../../../utils/custom_widgets/custom_authentication_ui.dart';
import '../../../utils/validator/validations.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
            child: Form(
          key: controller.signUpFormKey,
          autovalidateMode: controller.autoValidateMode,
          child: CustomAuthenticationUi(
            emailController: controller.emailController,
            passwordController: controller.passwordController,
            isPasswordVisible: controller.isPasswordVisible.value,
            titleText: 'Sign Up',
            emailValidator: (value) {
              if (!isEmail(value!)) {
                return "Please enter a valid email";
              }
              return null;
            },
            passwordValidator: (value) =>
                value!.isEmpty ? "Please enter password" : null,
            onButtonPressed: () {
              if (controller.signUpFormKey.currentState!.validate()) {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.onSignUpPressed();
              } else {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.autoValidateMode = AutovalidateMode.always;
                controller.update();
              }
            },
            onTextPressed: () {
              Get.back();
            },
            onIconPressed: () {
              controller.onGoogleSignUpClicked();
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
