import 'package:flutter/material.dart';
import 'add_product_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("data"),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          navigateToAddProduct();
        },
        tooltip: "Add Products",
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
