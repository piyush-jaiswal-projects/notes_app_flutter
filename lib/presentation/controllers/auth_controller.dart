import 'package:get/get.dart';
import 'package:notes_app_flutter/presentation/screens/error.dart';
import 'package:notes_app_flutter/presentation/screens/home.dart';
import 'package:notes_app_flutter/presentation/screens/login.dart';
import 'package:notes_app_flutter/presentation/screens/signup.dart';
import 'package:notes_app_flutter/presentation/screens/splash.dart';
import 'package:notes_app_flutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  bool viewLogin = true;

  void toggleLoginView() {
    viewLogin = !viewLogin;
  }

  void loginUser(String email, String password) async {
    try {
      UserCredential? userCredential =
          await _authService.signInWithEmailAndPassword(email, password);
      if (userCredential != null) {
        Get.to(Home());
      }
    } on FirebaseAuthException catch (e) {
      Get.to(ErrorPage(errType: "Login Failed!", errMsg: e.message ?? ""));
      await Future.delayed(const Duration(seconds: 3));
      Get.to(LoginWidget());
    } catch (err) {
      Get.to(const ErrorPage(
          errType: "Login Failed!", errMsg: "Please try again!"));
      await Future.delayed(const Duration(seconds: 3));
      Get.to(LoginWidget());
    }
  }

  void signupUser(String name, String email, String password) async {
    try {
      UserCredential? userCredential = await _authService
          .registerWithEmailAndPassword(name, email, password);
      if (userCredential != null) {
        Get.to(Home());
      }
    } on FirebaseAuthException catch (e) {
      Get.to(ErrorPage(errType: "Signup Failed!", errMsg: e.message ?? ""));
      await Future.delayed(const Duration(seconds: 3));
      Get.to(SignupWidget());
    } catch (err) {
      Get.to(const ErrorPage(
          errType: "Signup Failed!", errMsg: "Please try again!"));
      await Future.delayed(const Duration(seconds: 3));
      Get.to(SignupWidget());
    }
  }

  void logoutUser() async {
    await _authService.signOut();
    Get.to(SplashScreen());
  }
}
