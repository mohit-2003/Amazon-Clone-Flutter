import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main-screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _screen = 0;
  final List<Widget> _screenList = [
    new HomeScreen(),
    new AccountScreen(),
    new Scaffold(body: new Center(child: new Text("Second")))
  ];

  void changeScreen(int screen) {
    setState(() {
      _screen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _screenList[_screen],
        bottomNavigationBar: new BottomNavigationBar(
            onTap: changeScreen,
            iconSize: 28,
            currentIndex: _screen,
            selectedItemColor: GlobalVariables.selectedNavBarColor,
            unselectedItemColor: GlobalVariables.unselectedNavBarColor,
            items: [
              new BottomNavigationBarItem(
                  icon: new Container(
                    width: 42,
                    decoration: new BoxDecoration(
                        border: new Border(
                            top: new BorderSide(
                                color: _screen == 0
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: 5))),
                    child: new Icon(Icons.home_outlined),
                  ),
                  label: ""),
              new BottomNavigationBarItem(
                  icon: new Container(
                    width: 42,
                    decoration: new BoxDecoration(
                        border: new Border(
                            top: new BorderSide(
                                color: _screen == 1
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: 5))),
                    child: new Icon(Icons.person_outline_outlined),
                  ),
                  label: ""),
              new BottomNavigationBarItem(
                  icon: new Container(
                    width: 42,
                    decoration: new BoxDecoration(
                        border: new Border(
                            top: new BorderSide(
                                color: _screen == 2
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: 5))),
                    child: new Badge(
                        badgeColor: Colors.white,
                        elevation: 0,
                        badgeContent: new Text("5"),
                        child: new Icon(Icons.shopping_cart_outlined)),
                  ),
                  label: ""),
            ]));
  }
}
