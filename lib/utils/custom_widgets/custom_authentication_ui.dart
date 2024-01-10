import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_styles/app_text_styles.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomAuthenticationUi extends StatelessWidget {
  const CustomAuthenticationUi({
    super.key,
    required this.emailValidator,
    required this.passwordValidator,
    required this.emailController,
    required this.passwordController,
    required this.onButtonPressed,
    required this.onTextPressed,
    required this.onIconPressed,
    required this.titleText,
    this.isSignIn,
  });
  final FormFieldValidator<String> emailValidator;
  final FormFieldValidator<String> passwordValidator;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onButtonPressed;
  final VoidCallback onTextPressed;
  final VoidCallback onIconPressed;
  final String titleText;
  final bool? isSignIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              titleText,
              style: AppTextStyles.bold48.copyWith(color: AppColors.whiteColor),
            ),
          ),
          const Spacer(),
          Container(
            height: Get.height * 0.7,
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    validator: emailValidator,
                    caption: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: '',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    validator: passwordValidator,
                    caption: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: '',
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  CustomButton(
                    height: Get.height * 0.07,
                    buttonText: isSignIn ?? false ? 'Sign In' : 'Sign Up',
                    onPressed: onButtonPressed,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Don’t have an account?  ',
                      style: AppTextStyles.regular16
                          .copyWith(color: const Color(0xff666666)),
                      children: <TextSpan>[
                        TextSpan(
                            text: isSignIn ?? false ? 'Sign Up' : 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTextPressed,
                            style: AppTextStyles.regular16
                                .copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: Get.height * 0.02,
                        bottom: Get.height * 0.02),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.textFieldColor,
                            thickness: 1,
                            indent: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          child: Text(
                            isSignIn ?? false ? 'sign in with' : 'sign up with',
                            style: AppTextStyles.regular16
                                .copyWith(color: AppColors.blackColor),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.textFieldColor,
                            thickness: 1,
                            indent: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onIconPressed,
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.height * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.1),
                            offset: const Offset(0, 0),
                            blurRadius: 6.0,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppImages.googleIcon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
