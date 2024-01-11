import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors/app_colors.dart';
import '../app_text_styles/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.validator,
      required this.controller,
      required this.keyboardType,
      required this.caption,
      this.inputFormatters,
      required this.hintText,
      this.isObscureText,
      this.isSuffixIcon,
      this.onSuffixIconPressed});

  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final String hintText;
  final String caption;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isObscureText;
  final bool? isSuffixIcon;
  final VoidCallback? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: AppTextStyles.bold18,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: isObscureText ?? false,
          style: AppTextStyles.semiBold16,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.regular16
                .copyWith(color: AppColors.hintTextColor),
            enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.textFieldColor, width: 1)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor, width: 1),
            ),
            suffixIcon: isSuffixIcon ?? false
                ? IconButton(
                    onPressed: onSuffixIconPressed,
                    icon: Icon(
                      isObscureText ?? false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.blackColor,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
