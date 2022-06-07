import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = new User(
      id: "",
      name: "",
      email: "",
      password: "",
      address: "",
      type: "",
      token: "");

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
