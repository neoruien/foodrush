import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class SignupPage extends StatefulWidget {
  static String newName;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final newUser = TextEditingController();
  final newPW = TextEditingController();
  final confirmPW = TextEditingController();
  bool isChecked = false;

  void confirmHandler() {
    setState(() {
      SignupPage.newName = '${newUser.text}';
      newUser.clear();
      newPW.clear();
      confirmPW.clear();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 55, 50, 10),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold,
                      fontSize: 34
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow[700],
                          width: 3.0,
                        ),
                      ),
                      hintText: 'New Username',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[700],
                            width: 3.0,
                          ),
                        ),
                        hintText: 'New Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[700],
                            width: 3.0,
                          ),
                        ),
                        hintText: 'Confirm New Password',
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          CheckboxListTile(
            title: Text(
              "I have read and agreed to the Terms \nand Conditions",
                style: GoogleFonts.poppins(
                    color: Colors.grey[850],
                    fontSize: 18
                )
            ),
            checkColor: Colors.yellow[800],
            activeColor: Colors.white,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FlatButton(
                onPressed: confirmHandler,
//                onPressed: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => MyBottomNavigationBar()
//                      )
//                  );
//                },
                color: Colors.yellow[800],
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                      color: Colors.grey[850],
                      fontSize: 18
                  )
                ),
              ),
              Row(children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(
                      color: Colors.grey[850],
                      fontSize: 18
                  )
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.poppins(
                        color: Colors.yellow[800],
                        fontSize: 18
                    )
                  ),
                ),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}