import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String loginType = 'loginType';
  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String userProfileImage = 'userProfileImage';
  static const String userEmail = 'userEmail';
  static const String accountCreatedTime = 'creationTime';
  static const String loginTime = 'loginTime';

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  static Future<void> setUserId(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, value);
  }

  static Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userId) ?? 0;
  }

  static Future<void> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userName, value);
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName) ?? "";
  }

  static Future<void> setLoginType(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginType, value);
  }

  static Future<String> getLoginType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginType) ?? "";
  }

  static Future<void> setProfileImage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userProfileImage, value);
  }

  static Future<String> getProfileImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfileImage) ?? "";
  }

  static Future<void> setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmail, value);
  }

  static Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail) ?? "";
  }

  static Future<void> setAccountCreationTime(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(accountCreatedTime, value);
  }

  static Future<String> getAccountCreationTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(accountCreatedTime) ?? "";
  }

  static Future<void> setLoginTime(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginTime, value);
  }

  static Future<String> getLoginTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginTime) ?? "";
  }

  static Future<void> clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
