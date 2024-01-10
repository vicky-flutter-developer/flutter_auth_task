part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const signInScreen = _Paths.signInScreen;
  static const signUpScreen = _Paths.signUpScreen;
  static const dashboardScreen = _Paths.homeScreen;
}

abstract class _Paths {
  _Paths._();

  static const splashScreen = '/splash';
  static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const homeScreen = '/homeScreen';
}