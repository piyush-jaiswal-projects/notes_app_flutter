import 'package:flutter/material.dart';
import 'package:notes_app_flutter/data/repositories/notes_repository.dart';
import 'package:notes_app_flutter/presentation/controllers/auth_controller.dart';
import 'package:notes_app_flutter/presentation/controllers/notes_controllers.dart';
import 'package:notes_app_flutter/presentation/screens/login.dart';
import 'package:notes_app_flutter/presentation/widgets/add_button.dart';
import 'package:notes_app_flutter/presentation/widgets/notes_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthController authController = Get.find<AuthController>();
  final NotesRepository notesRepository = Get.put(NotesRepository());

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    var userName = user?.displayName;
    var count = notesRepository.getAllNotes().length;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white60,
          actions: [
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == "Logout") {
                  authController.logoutUser();
                  Get.to(LoginWidget());
                }
                else if (value == "Home") {
                  authController.logoutUser();
                  Get.to(Home());
                }
              },
              color: Colors.white,
              icon: const Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return {'Home', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          title: Text("$userName's Notes ($count)"),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
            child: Center(
              child: SingleChildScrollView(
                child: Wrap(),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: AddButton(
              color: Colors.white,
              circularRadius: 15,
              onPressed: () {
                print("Button pressed!");
              },
            ),
          ),
        ],
      ),
    );
  }
}
