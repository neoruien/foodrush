import 'package:flutter/material.dart';
import 'package:foodrush/pages/shoppinglist.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';


class ShoppinglistPage extends StatefulWidget {
  @override
  _ShoppinglistPageState createState() => _ShoppinglistPageState();
}

class _ShoppinglistPageState extends State<ShoppinglistPage> {

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add an item to shopping list'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Add a new item"),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('ADD'),
                onPressed: () {
                  setState(() {
                    User.shoppingList.add(_textFieldController.text);
                    Navigator.of(context).pop();
                  });
                },
              ),
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping List',
          style: GoogleFonts.poppins(
              color: Colors.grey[850],
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[850],
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: User.shoppingList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(
                  '${index + 1}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold
                  ),
                ),
                title: Text(
                  '${User.shoppingList[index]}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.w600
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    setState(() {
                      User.shoppingList.remove(User.shoppingList[index]);
                    });
                  },
                )
              ),
            ),
            FlatButton(
              child: Text(
                'Add an item',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[850]
                ),
              ),
              color: Colors.amber[200],
              onPressed: () {
                _displayDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
