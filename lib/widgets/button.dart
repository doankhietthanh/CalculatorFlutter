import 'dart:ffi';

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final List color, textColor;
  final Function onPressed;
  final double width, height;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: width,
          height: height,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500)),
              child: Text(
                text,
                style: TextStyle(fontSize: 28),
              ),
              onPressed: () => onPressed(text),
              color: Color.fromARGB(color[0], color[1], color[2], color[3]),
              textColor: Color.fromARGB(
                  textColor[0], textColor[1], textColor[2], textColor[3]))),
    );
  }
}
