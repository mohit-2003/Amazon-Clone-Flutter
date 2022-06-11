import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final int maxLines;
  const CustomTextField(
      {Key? key, required this.controller, this.hintText, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Check your $hintText";
        }
        return null;
      },
      decoration: new InputDecoration(
          hintText: hintText,
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black38)),
          enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black38))),
    );
  }
}
