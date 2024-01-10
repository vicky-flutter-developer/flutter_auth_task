import 'package:flutter/material.dart';
import 'package:flutter_auth_task/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:flutter_auth_task/utils/app_images/app_images.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.splashImage), fit: BoxFit.fill)),
    );
  }
}
