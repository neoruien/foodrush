import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './message.dart';
import 'otherprofilepage.dart';

class PersonalChat extends StatefulWidget {
  final String name;

  PersonalChat(this.name);

  @override
  _PersonalChatState createState() => _PersonalChatState(name);
}

class _PersonalChatState extends State<PersonalChat> {
  String name;
  String text;
  final sendButton = TextEditingController();
  List<Widget> list = [];

  _PersonalChatState(this.name);

  void manageTextInput() {
    setState(() {
      text = sendButton.text;
      sendButton.clear();
      list.add(new Message(text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[850]),
          title: Text('$name',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[850])
              ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OtherProfilePage('$name')),
                );
              },
            )
          ],
          backgroundColor: Colors.amber,
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: 500,
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 10, 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: list)),
              ),
            ),
            Container(
              alignment: Alignment(0.95, 0.95),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Container(
                    width: 280,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          controller: sendButton,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: 'Message',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500
                              )),
                          onChanged: (content) {
                            text = content;
                          }),
                    ),
                  ),
                ),
                ButtonTheme(
                    minWidth: 12,
                    child: RaisedButton(
                        onPressed: manageTextInput,
                        color: Colors.amber,
                        child: Text(
                          'Send',
                          style:
                          TextStyle(color: Colors.grey[800], fontSize: 18),
                        ))
                ),
                SizedBox(width: 10)
              ]),
            )
          ],
        ));
  }
}
