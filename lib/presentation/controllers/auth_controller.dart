import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLoggedIn = false;
  bool viewLogin = true;

  void toggleLoginView() {
    viewLogin = !viewLogin;
  }

  void loginUser() {
    isLoggedIn = true;
  }

  void signupUser() {
    isLoggedIn = true;
  }

  void logoutUser() {
    isLoggedIn = false;
  }
}
