import 'package:flutter_auth_task/screens/signup_screen/binding/signup_screen_binding.dart';
import 'package:flutter_auth_task/screens/signup_screen/view/signup_screen_view.dart';
import 'package:get/get.dart';
import '../screens/home_screen/binding/home_screen_binding.dart';
import '../screens/home_screen/view/home_screen_view.dart';
import '../screens/sign_in_screen/binding/sign_in_screen_binding.dart';
import '../screens/sign_in_screen/view/sign_in_screen_view.dart';
import '../screens/splash_screen/binding/splash_screen_binding.dart';
import '../screens/splash_screen/view/splash_screen_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.signUpScreen,
      page: () => const SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.signInScreen,
      page: () => const SignInScreenView(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
        name: _Paths.homeScreen,
        page: () => const HomeScreenView(),
        binding: HomeScreenBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
  ];
}
