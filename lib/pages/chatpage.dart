import 'package:flutter/material.dart';
import 'package:foodrush/pages/personalchat.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  int position = 1;

  final names = [
    'Kristie Zhang',
    'Rachel Tan',
    'Chloe Wong',
    'Ryan Lim',
    'Dominic Neo',
    'Steve Jobs',
    'Notch Lim',
    'Melvin Lim',
    'Clarrisa Tan',
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay',
    'Maybelline Neo',
    'Justina Tay',
    'Priscilla Lau',
    'Sharon Sim',
    'Joe Doe',
    'Tom Lau',
    'Harry Lau',
    'Phoenix Cheng'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          'Chat',
          style: GoogleFonts.poppins(
              color: Colors.grey[850],
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[850], size: 25),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[850],
            ),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset('images/Other person.png'),
                title: Text(
                    '${names[index]}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey[850]
                    )),
                subtitle: Text(
                  'Hello ru there?',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[600]
                  )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalChat('${names[index]}')),
                  );
                },
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
              );
            },
            itemCount: names.length,
          )
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final names = [
    'Kristie Zhang',
    'Rachel Tan',
    'Chloe Wong',
    'Ryan Lim',
    'Dominic Neo',
    'Steve Jobs',
    'Notch Lim',
    'Melvin Lim',
    'Clarrisa Tan',
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay',
    'Maybelline Neo',
    'Justina Tay',
    'Priscilla Lau',
    'Sharon Sim',
    'Joe Doe',
    'Tom Lau',
    'Harry Lau',
    'Phoenix Cheng'
  ];

  final recentNames = [
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // shows some result based on the selection
    return Text(
        query
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // shows when someone searches for something
    final suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/Other person.png'),
          backgroundColor: Colors.grey[200],
          radius: 40,
        ),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    color: Colors.grey[850],
                    fontWeight: FontWeight.w600
                ),
                children: [TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                    )
                )]
            )
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: Colors.amber,
        textTheme: TextTheme(
            title: TextStyle(
                fontSize: 21.0,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
        )
    );
  }
}