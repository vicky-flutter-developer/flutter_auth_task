import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/shared_preferences/shared_preferences.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppPreferences.setUserEmail(_auth.currentUser?.email ?? "");
      AppPreferences.setAccountCreationTime(
          _auth.currentUser?.metadata.creationTime?.toLocal().toString() ?? "");
      AppPreferences.setLoginTime(
          _auth.currentUser?.metadata.lastSignInTime?.toLocal().toString() ??
              "");
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return "something went wrong, try again";
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      AppPreferences.setUserEmail(_auth.currentUser?.email ?? "");
      AppPreferences.setAccountCreationTime(
          _auth.currentUser?.metadata.creationTime?.toLocal().toString() ?? "");
      AppPreferences.setLoginTime(
          _auth.currentUser?.metadata.lastSignInTime?.toLocal().toString() ??
              "");
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return "something went wrong, try again";
    }
  }

  //GOOGLE SIGN IN /SIGN UP
  Future<UserCredential> googleAuthentication() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
