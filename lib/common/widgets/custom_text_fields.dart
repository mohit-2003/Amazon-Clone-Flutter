import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const CustomTextField({Key? key, required this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: controller,
      decoration: new InputDecoration(
          hintText: hintText,
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black38)),
          enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black38))),
    );
  }
}
