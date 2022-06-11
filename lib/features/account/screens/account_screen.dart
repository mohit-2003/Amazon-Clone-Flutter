import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:amazon_clone/features/account/widgets/your_orders.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: new AppBar(
            flexibleSpace: new Container(
              decoration:
                  new BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: new Image.asset(
              "assets/images/amazon_in.png",
              width: 120,
              height: 45,
              color: Colors.black,
            ),
            actions: [
              new IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: new Icon(Icons.notifications_outlined),
              ),
              new IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: new Icon(Icons.search))
            ],
          )),
      body: new Column(
        children: [
          new BelowAppBar(),
          new SizedBox(height: 10),
          new TopButtons(),
          new SizedBox(
            height: 10,
          ),
          new YourOrders()
        ],
      ),
    );
  }
}
