import 'package:flutter/material.dart';
import 'package:foodrush/pages/navbar.dart';
import 'package:foodrush/pages/signuppage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static String name;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameHandler = TextEditingController();
  final passwordHandler = TextEditingController();

  void manageTextInput() {
    setState(() {
      LoginPage.name = '${usernameHandler.text}';
      usernameHandler.clear();
      passwordHandler.clear();
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            MyBottomNavigationBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset('images/Logo (with words).png', scale: 0.8),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Text(
                'Welcome!',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow[700],
                        width: 3.0,
                      ),
                    ),
                    hintText: 'Username',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: TextField(
                    controller: passwordHandler,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow[700],
                          width: 3.0,
                        ),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 100,
                  child: FlatButton(
                    onPressed: manageTextInput,
//                    onPressed: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => MyBottomNavigationBar()
//                          )
//                      );
//                    },
                    color: Colors.yellow[800],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                        'Log in',
                        style: GoogleFonts.poppins(
                          color: Colors.grey[850],
                          fontSize: 20
                        ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New User?",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[850],
                              fontSize: 18
                          ),
                        ),
                        FlatButton(
                          textColor: Colors.yellow[800],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()
                                )
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                color: Colors.grey[850],
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                          ),
                        ),
                      ]),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
