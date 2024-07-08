import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLoggedIn = false;

  void loginUser() {
    print('User logged in!');
    isLoggedIn = true;
  }

  void logoutUser() {
    print('User logged out!');
    isLoggedIn = false;
  }
}
