import 'package:flutter/material.dart';
import 'package:foodrush/pages/chatpage.dart';
import 'package:foodrush/pages/foodpage.dart';
import 'package:foodrush/pages/loginpage.dart';
import 'package:foodrush/pages/navbar.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/navbar': (context) => MyBottomNavigationBar()
      },
    );
  }
}