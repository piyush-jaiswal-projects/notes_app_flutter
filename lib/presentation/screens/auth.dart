import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/presentation/controllers/auth_controller.dart';
import 'package:notes_app_flutter/presentation/screens/home.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});
  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<Auth> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          const Text("Login"),
          ElevatedButton(
              onPressed: (){
                authController.loginUser();
                Get.to(const Home());
                },
              child: const Text("Login")),
          Row(
            children: [
              const Text("Don't have account?"),
              GestureDetector(
                onTap: () => {},
                child: const Text("Create New"),
              )
            ],
          )
        ],
      ),
    );
  }
}
