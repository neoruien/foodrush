import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodrush/pages/navbar.dart';
import 'package:foodrush/pages/productdetailspage.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodrush/pages/product.dart';
import 'product.dart';
import 'package:intl/intl.dart';
import 'package:foodrush/pages/shoppinglist.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<Product> products = [
    Product(
        'Brown sugar.png',
        'Brown sugar',
        5.0,
        'Uncle Tan',
        "Tastes best in bubble tea \n"
            "This should expand the bubble",
        '27 Marsiling Drive',
        DateTime(2020, 03, 6)
    ),
    Product(
        'White sugar.jpg',
        'White sugar',
        6.5,
        'Uncle Lim',
        'As white as snow',
        'Jurong East Street 21',
        DateTime(2020, 05, 6)
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
            'Browse',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.grey[850]
            )
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.format_list_numbered, color: Colors.grey[850]),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Card(
                          color: Colors.grey[300],
                          child: FlatButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.search, color: Colors.grey[850]),
                                SizedBox(width: 10),
                                Text(
                                    'Search',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Colors.grey[850]
                                    )
                                )
                              ],
                            ),
                            onPressed: () {},
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 50,
                    child: Card (
                      color: Colors.amber,
                      child: IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.grey[850],
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(width: 30)
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Card(
                          color: Colors.amber,
                          child: FlatButton(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Image.asset('images/Candy.png', height: 20, width: 20),
                                SizedBox(width: 20),
                                Text(
                                    'Sugar',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.white
                                    )
                                ),
                                SizedBox(width: 30)
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Card(
                          color: Colors.grey[300],
                          child: FlatButton(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Image.asset('images/veggies.png', height: 30, width: 30),
                                SizedBox(width: 20),
                                Text(
                                    'Veggie',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.grey[850]
                                    )
                                ),
                                SizedBox(width: 30)
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Card(
                          color: Colors.grey[300],
                          child: FlatButton(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Image.asset('images/eggs.png', height: 25, width: 25),
                                SizedBox(width: 20),
                                Text(
                                    'Eggs',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.grey[850]
                                    )
                                ),
                                SizedBox(width: 30)
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  height: 430,
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) => Container(
                          color: Colors.white,
                          height: 321,
                          width: 140,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.grey[300], width: 5)
                              ),
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(products[index])
                                    )
                                  );
                                },
                                color: Color(0x00000000),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 200,
                                      width: 200,
                                      child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Image.asset('images/${products[index].thumbnail}')
                                      ),
                                    ),
                                    Text(
                                      products[index].productName,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.yellow[800]
                                      ),
                                    ),
                                    Text(
                                      'Best before: '
                                          '${DateFormat('dd/MM/yyyy').format(products[index].bestBefore)}',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey[850]
                                      ),
                                    ),
                                    Text(
                                        '\$ ${products[index].price.toStringAsFixed(2)}',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.yellow[800]
                                        )
                                    )
                                  ],
                                ),
                              )
                          )
                      )
                  ),
                ),
              )],
          )
      ),
      drawer: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/Uncle Sam.png'),
                          backgroundColor: Colors.grey[200],
                          radius: 40.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Uncle Sam',
                          style: GoogleFonts.poppins(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          'Your shopping list:',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
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
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
