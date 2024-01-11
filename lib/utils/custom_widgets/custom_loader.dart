import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white.withOpacity(0.2),
      child: Center(
        child: LoadingAnimationWidget.inkDrop(
            color: const Color(0xff384CA0), size: 40),
      ),
    );
  }
}
