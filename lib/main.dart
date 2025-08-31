import 'package:flutter/material.dart';
import 'package:movie/auth/login_screen.dart';
import 'package:movie/home.dart';

void main() {
  runApp(Movies());
}

class Movies extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => Home(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      initialRoute: Home.routeName,
    );
  }
}
