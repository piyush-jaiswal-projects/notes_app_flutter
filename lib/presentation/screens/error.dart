import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errType;
  final String errMsg;

  const ErrorPage({Key? key, required this.errType, required this.errMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/pxfuel.jpg"), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Optional: center the text vertically
              children: [
                Center(
                  child: Text(
                    errType,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    errMsg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
