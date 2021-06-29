import 'package:flutter/material.dart';
import 'package:foodrush/pages/checkoutpage.dart';
import 'package:foodrush/pages/product.dart';
import 'package:foodrush/pages/productdetailspage.dart';
import 'package:foodrush/pages/profilepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:foodrush/pages/shoppinglistpage.dart';

import 'cartpage.dart';
import 'chatpage.dart';
import 'foodpage.dart';
import 'homepage.dart';

int currentIndex;

List<Widget> children =
[
  HomePage(),
  FoodPage(),
  ChatPage(),
  CartPage(),
  ProfilePage(),
  ShoppinglistPage(),
  CheckoutPage()
];

class MyBottomNavigationBar extends StatefulWidget {

  MyBottomNavigationBar() {
    currentIndex = 0;
  }

  MyBottomNavigationBar.other_index(int other) {
    currentIndex = other;
  }

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex <= 4
            ? currentIndex
            : currentIndex == 5
              ? 0
              : currentIndex == 6
                ? 3
                : 3
        ,
        color: Colors.grey[200],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.amber[100],
        height: 65,
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.fastfood),
          Icon(Icons.chat),
          Icon(Icons.shopping_cart),
          Icon(Icons.person)
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}