import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {Key? key,
      required this.color,
      required this.circularRadius,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final double circularRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularRadius), color: color),
      alignment: Alignment.bottomRight,
      width: 70,
      height: 70,
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], color: color, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/add.svg",
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
