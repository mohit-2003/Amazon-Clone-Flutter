import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:amazon_clone/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signupUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = new User(
          id: "",
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");
      http.Response response = await http.post(Uri.parse("$apiUrl/api/signup"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: user.toJson());
      httpError(
          response: response,
          context: context,
          onSuccess: () => showSnackBar(
              context, "Account Created, Login with same credential"));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signinUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(Uri.parse("$apiUrl/api/signin"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode({"email": email, "password": password}));

      httpError(
          response: response,
          context: context,
          onSuccess: () async {
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                "auth-token", jsonDecode(response.body)["token"]);
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({required BuildContext context}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("auth-token");

      if (token == null) {
        await prefs.setString("auth-token", "");
      }
      http.Response response = await http.post(
        Uri.parse("$apiUrl/isTokenValid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token!
        },
      );

      var res = jsonDecode(response.body);
      if (res == true) {
        http.Response response = await http.get(
          Uri.parse("$apiUrl/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(response.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
