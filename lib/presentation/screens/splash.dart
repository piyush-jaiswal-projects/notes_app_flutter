import 'dart:async';
import './home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/presentation/controllers/auth_controller.dart';
import 'package:notes_app_flutter/presentation/screens/login.dart';
import 'package:notes_app_flutter/presentation/screens/error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  final AuthController authController = Get.find<AuthController>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Get.to(auth.currentUser != null ? Home() : LoginWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the screen
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pxfuel.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          verticalDirection: VerticalDirection.down,
          children: [
            VerticalDivider(width: 200),
            Text(
              "Note It",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
