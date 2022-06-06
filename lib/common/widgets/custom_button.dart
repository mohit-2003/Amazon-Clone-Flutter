import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;
  const CustomButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ElevatedButton(
        onPressed: onPressed(),
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: new Size(double.infinity, 50),
        ),
        child: new Text(text));
  }
}
