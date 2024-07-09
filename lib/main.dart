import 'package:flutter/material.dart';
import 'presentation//screens/splash.dart';
import 'package:get/get.dart';
import 'presentation/controllers/auth_controller.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Notes",
      home: SplashScreen(),
    );
  }
}
