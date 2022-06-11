import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/routes.dart';
import 'package:amazon_clone/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/admin/screens/admin_screen.dart';

void main() {
  runApp(new MultiProvider(providers: [
    new ChangeNotifierProvider(create: (context) => new UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = new AuthServices();
  @override
  void initState() {
    super.initState();
    authServices.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'Amazon Clone',
      theme: ThemeData(
          colorScheme:
              new ColorScheme.light(primary: GlobalVariables.secondaryColor),
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: new AppBarTheme(
              elevation: 0, iconTheme: new IconThemeData(color: Colors.black))),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? new AuthScreen()
          : Provider.of<UserProvider>(context).user.type == "user"
              ? new MainScreen()
              : new AdminScreen(),
    );
  }
}
