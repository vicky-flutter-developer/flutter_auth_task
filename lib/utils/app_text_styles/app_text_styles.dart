import 'package:flutter/material.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const bold48 = TextStyle(fontSize: 48, fontWeight: FontWeight.w700);
  static const bold18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const bold22 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  static const regular16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const semiBold16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
}
