import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodrush/pages/loginpage.dart';
import 'package:foodrush/pages/signuppage.dart';
import 'signuppage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int i = 0;
  String name = (LoginPage.name != null) ? LoginPage.name
      : SignupPage.newName;
  TextEditingController _textFieldController = TextEditingController();
  bool b = true;

  Widget b_widget(b) {
    if (b) {
      return Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: User.reviewList.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[600],
                radius: 30,
              ),
              title: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  User.reviewList[index],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                )
              ),
            )
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow[700],
                          width: 3.0,
                        ),
                      ),
                      hintText: 'Leave a review',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              FlatButton(
                color: Colors.amber[200],
                child: new Text('ADD'),
                onPressed: () {
                  setState(() {
                    User.reviewList.add('${User.username}: ${_textFieldController.text}');
                  });
                },
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Center(
            child: Text(
              'Favourites',
              style: GoogleFonts.satisfy(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline,
              ),
            )
          ),
          SizedBox(height: 25),
          ListView.builder(
            shrinkWrap: true,
            itemCount: User.favouriteList.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[600],
                radius: 30,
              ),
              title: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  User.favouriteList[index],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
                )
              )
            ),
          ),
          SizedBox(height: 25.0),
          Center(
            child: Text(
              'All Purchases',
              style: GoogleFonts.satisfy(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: User.purchasedList.length,
            itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[600],
                  radius: 30,
                ),
                title: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Text(
                        User.purchasedList[index],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )
                    )
                )
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
                color: Colors.grey[850],
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          elevation: 0.0,
          leading: Container(),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        i++;
                        print('You clicked ' + i.toString() + ' times.');
                      },
                      iconSize: 200.0,
                      icon: CircleAvatar(
                        backgroundImage: AssetImage('${User.profilePic}'),
                        backgroundColor: Colors.grey[300],
                        radius: 200.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 45.0,
                color: Colors.black,
              ),
              Center(
                child: Text(
                  User.username,
                  style: GoogleFonts.raleway(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  'ID: 1234567890',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ratings: ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(Icons.star,),
                    Icon(Icons.star,),
                    Icon(Icons.star,),
                    Icon(Icons.star,),
                    Icon(Icons.star_half,),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RaisedButton(
                  color: Colors.amber[400],
                  padding: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.amber),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    print('Logged out');
                  },
                  child: Text(
                    'Log out',
                    style: GoogleFonts.raleway(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 60,
                color: Colors.black,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                          'Favourites',
                          style: GoogleFonts.satisfy(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                          ),
                        )
                    ),
                    SizedBox(height: 25),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: User.favouriteList.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[600],
                            radius: 30,
                          ),
                          title: Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Text(
                                  User.favouriteList[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Center(
                      child: Text(
                        'All Purchases',
                        style: GoogleFonts.satisfy(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: User.purchasedList.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[600],
                            radius: 30,
                          ),
                          title: Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Text(
                                  User.purchasedList[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )
                              )
                          )
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}