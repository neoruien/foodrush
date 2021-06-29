import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;

  Message(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.yellow[600]),
            color: Colors.yellow[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$text',
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Colors.grey[850], fontSize: 20),
          ),
        ));
  }
}
