import 'package:flutter/material.dart';
import 'package:foodrush/pages/product.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<Product,int> cart = {
    Product(
        'Brown sugar.png',
        'Brown sugar',
        5.0,
        'Uncle Tan',
        "Tastes best in bubble tea \n"
            "This should expand the bubble",
        '27 Marsiling Drive',
        DateTime(2020, 03, 6)
    ): 3,
    Product(
        'Brown sugar.png',
        'Brown sugar 2',
        10.0,
        'Uncle Bob',
        "Tastes best in bubble tea \n"
            "This should expand the bubble",
        '27 Marsiling Drive',
        DateTime(2020, 03, 6)
    ): 4
  };
  bool isInit = false;
  double total = 0;

  List<Widget> getWidgets() {
    List<Widget> out = [];
    cart.forEach((key, value) {
      double priceOfItems = key.price * value;
      if (!isInit) total += priceOfItems;

      out.add(Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.amber[300])
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(child: Image.asset('images/${key.thumbnail}'))
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                        '${key.productName} : '
                            '\$ ${key.price.toStringAsFixed(2)} / pkt',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18
                        )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (value > 1) {
                                    cart[key] = value - 1;
                                    total = 0;
                                  }
                                  if (value == 1) {
                                    cart[key] = value - 1;
                                    total = 0;
                                    cart.remove(key);
                                  }
                                  isInit = false;
                                });
                              },
                            ),
                            Container(
                                child: Text(
                                    '$value',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15
                                    )
                                )
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cart[key] = value + 1;
                                  total = 0;
                                  isInit = false;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Text(
                              '${priceOfItems.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20
                              )
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ));
    });
    isInit = true;
    out.add(Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          alignment: Alignment.bottomRight,
          child: Text(
              'Total: ${total.toStringAsFixed(2)}',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20
              )
          )
      ),
    ));
    out.add(SizedBox(height: 150));
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shopping Cart',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.grey[850]
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          elevation: 0,
          leading: Container(),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate( getWidgets() ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                List<Product> cartProduct = cart.keys.toList();
                User.cartList.clear();
                User.cartNumList.clear();
                cartProduct.forEach((element) {
                  User.cartList.add(element.productName);
                  User.cartNumList.add(cart[element]);
                  User.totalPrice = total;
              });
              });
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                return MyBottomNavigationBar.other_index(6);
              }));
            },
            label: Text('To Checkout'),
            backgroundColor: Colors.amber[800],
            icon: Icon(Icons.shopping_cart)
        ),
    );
  }
}