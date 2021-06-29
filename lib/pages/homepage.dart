import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            color: Colors.grey[850],
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                child: Image.asset('images/Logo (with words).png'),
              alignment: Alignment.topCenter,
            ),
            SizedBox(height: 30),
            FlatButton(
              child: Text(
                'Shopping list',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[850]
                ),
              ),
              color: Colors.amber[200],
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return MyBottomNavigationBar.other_index(5);
                }));
              },
            ),
            SizedBox(height: 15),
            FlatButton(
              child: Text(
                'Food donation',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[850]
                ),
              ),
              color: Colors.amber,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

/*
Center(
              child: IconButton(
                onPressed: () {
                  print('You clicked All Food');
                },
                iconSize: 200.0,
                icon: CircleAvatar(
                  backgroundImage: AssetImage('images/crice.jpg'),
                  radius: 200.0,
                ),
              ),
            ),
            Text(
              'Foodrush',
              style: TextStyle(
                fontSize: 50.0,
                fontFamily: 'Satisfy',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We speak food.',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 50.0),
            FlatButton(
              color: Colors.yellow[700],
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () {
                print('You clicked on me');
              },
              child: Text(
                'Get started',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
 */