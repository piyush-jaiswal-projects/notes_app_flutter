import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white70
          ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Note Title", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("This is the note description")
        ],
      ),
    ));
  }
}
