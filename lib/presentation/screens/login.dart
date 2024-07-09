import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/presentation/controllers/auth_controller.dart';
import 'package:notes_app_flutter/presentation/screens/home.dart';
import 'package:notes_app_flutter/presentation/screens/signup.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/authBg.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const Text(
                "LOGIN",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Email",
                      hintStyle:
                          const TextStyle(color: Colors.black54, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    )),
                    const SizedBox(height: 10,),
                    TextField(
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Password",
                      hintStyle:
                          const TextStyle(color: Colors.black54, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    )),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: () {
                          authController.loginUser();
                          Get.to(const Home());
                        },
                        child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.black)),),
                    const SizedBox(height: 20,),
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupWidget());
                      },
                      child: const Text(
                        "Create New Account",
                        style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
