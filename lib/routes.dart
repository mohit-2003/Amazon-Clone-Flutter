import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return new MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => new AuthScreen(),
      );
    default:
      return new MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => new Scaffold(
                  body: new Center(
                child: new Text("Error 404 not found!"),
              )));
  }
}
