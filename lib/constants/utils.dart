import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(new SnackBar(content: new Text(msg)));
}
