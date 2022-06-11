import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: new BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: new RichText(
        text: new TextSpan(
            text: "Hello, ",
            style: new TextStyle(fontSize: 22, color: Colors.black),
            children: [
              new TextSpan(
                  text: user.name,
                  style: new TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))
            ]),
      ),
    );
  }
}
