import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_text_fields.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { login, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signup;
  final GlobalKey _signUpFormKey = new GlobalKey<FormState>();
  final GlobalKey _signInFormKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: new SafeArea(
          child: new Padding(
        padding: EdgeInsets.all(8),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Text(
              "Welcome",
              style: new TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            new ListTile(
              tileColor: auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: new Text(
                "Create Account",
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: new Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      auth = value!;
                    });
                  }),
            ),
            if (auth == Auth.signup)
              new Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: new Form(
                    key: _signUpFormKey,
                    child: new Column(
                      children: [
                        new CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new CustomButton(
                            text: "Sign Up",
                            color: GlobalVariables.secondaryColor,
                            onPressed: () {})
                      ],
                    )),
              ),
            new ListTile(
              tileColor: auth == Auth.login
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: new Text(
                "Sign-In",
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: new Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.login,
                  groupValue: auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      auth = value!;
                    });
                  }),
            ),
            if (auth == Auth.login)
              new Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: new Form(
                    key: _signInFormKey,
                    child: new Column(
                      children: [
                        new CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new CustomButton(
                            text: "Sign In",
                            color: GlobalVariables.secondaryColor,
                            onPressed: () {})
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
