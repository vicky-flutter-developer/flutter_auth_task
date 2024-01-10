import 'package:flutter/material.dart';
import 'package:flutter_auth_task/utils/app_colors/app_colors.dart';
import 'package:flutter_auth_task/utils/app_text_styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.height,
      this.width,
      this.onPressed,
      this.boxShadow,
      this.borderColor,
      required this.buttonText});

  final double height;
  final double? width;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final bool? boxShadow;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.4),
              offset: const Offset(0, 5),
              blurRadius: 10.0,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.bold22.copyWith(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
