import 'package:flutter/material.dart';
import 'package:flutter_auth_task/screens/signup_screen/controller/signup_screen_controller.dart';
import 'package:get/get.dart';
import '../../../utils/custom_widgets/custom_authentication_ui.dart';
import '../../../utils/validator/validations.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: controller.signUpFormKey,
        autovalidateMode: controller.autoValidateMode,
        child: CustomAuthenticationUi(
          emailController: controller.emailController,
          passwordController: controller.passwordController,
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
          onIconPressed: () {},
        ),
      )
          // Container(
          //   height: Get.height,
          //   width: Get.width,
          //   color: AppColors.primaryColor,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Spacer(),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 25),
          //         child: Text(
          //           "Sign Up",
          //           style: AppTextStyles.bold48
          //               .copyWith(color: AppColors.whiteColor),
          //         ),
          //       ),
          //       const Spacer(),
          //       Container(
          //         height: Get.height * 0.7,
          //         width: Get.width,
          //         decoration: const BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(25),
          //               topRight: Radius.circular(25)),
          //           color: AppColors.whiteColor,
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(15),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               CustomTextFormField(
          //                 validator: (String? value) {},
          //                 caption: "Email",
          //                 controller: controller.emailController,
          //                 keyboardType: TextInputType.emailAddress,
          //                 hintText: '',
          //               ),
          //               const SizedBox(
          //                 height: 40,
          //               ),
          //               CustomTextFormField(
          //                 validator: (String? value) {},
          //                 caption: "Password",
          //                 controller: controller.emailController,
          //                 keyboardType: TextInputType.emailAddress,
          //                 hintText: '',
          //               ),
          //               SizedBox(
          //                 height: Get.height * 0.06,
          //               ),
          //               CustomButton(
          //                 height: Get.height * 0.07,
          //                 buttonText: 'Sign Up',
          //               ),
          //               SizedBox(
          //                 height: Get.height * 0.03,
          //               ),
          //               RichText(
          //                 text: TextSpan(
          //                   text: 'Already have an account?  ',
          //                   style: AppTextStyles.regular16
          //                       .copyWith(color: const Color(0xff666666)),
          //                   children: <TextSpan>[
          //                     TextSpan(
          //                         text: 'Sign In',
          //                         recognizer: TapGestureRecognizer()
          //                           ..onTap = () {
          //                             Get.back();
          //                           },
          //                         style: AppTextStyles.regular16
          //                             .copyWith(color: AppColors.primaryColor)),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.only(
          //                     left: 20,
          //                     right: 20,
          //                     top: Get.height * 0.02,
          //                     bottom: Get.height * 0.02),
          //                 child: Row(
          //                   children: [
          //                     const Expanded(
          //                       child: Divider(
          //                         color: AppColors.textFieldColor,
          //                         thickness: 1,
          //                         indent: 1,
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.symmetric(
          //                           horizontal: Get.width * 0.04),
          //                       child: Text(
          //                         'sign up with',
          //                         style: AppTextStyles.regular16
          //                             .copyWith(color: AppColors.blackColor),
          //                         textAlign: TextAlign.left,
          //                       ),
          //                     ),
          //                     const Expanded(
          //                       child: Divider(
          //                         color: AppColors.textFieldColor,
          //                         thickness: 1,
          //                         indent: 1,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 height: Get.height * 0.07,
          //                 width: Get.height * 0.07,
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   color: AppColors.whiteColor,
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: AppColors.blackColor.withOpacity(0.1),
          //                       offset: const Offset(0, 0),
          //                       blurRadius: 6.0,
          //                       spreadRadius: 1,
          //                     ),
          //                   ],
          //                 ),
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Image.asset(
          //                     AppImages.googleIcon,
          //                     fit: BoxFit.contain,
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
