import 'package:flutter/material.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  bool _isChecked_cash = false;
  bool _isChecked_nets = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[850]),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.grey[850]
          )
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: ListView(
            children: <Widget>[
              Text('Order at', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
              Card(
                child: Column(
                  children: <Widget>[
                    Text('Uncle Tan Noodle Shop', style: GoogleFonts.poppins(fontSize: 16)),
                    Text('Maxwell Food Centre, Singapore 069184', style: GoogleFonts.poppins(fontSize: 16),
                    textAlign: TextAlign.center),
                    Text('#01-12', style: GoogleFonts.poppins(fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text('Order Summary', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
              Card(
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: User.cartList.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(User.cartList[index], style: GoogleFonts.poppins(fontSize: 16)),
                        trailing: Text('${User.cartNumList[index]}', style: GoogleFonts.poppins(fontSize: 16)),
                      ),
                    ),
                    Text('Total: ${User.totalPrice.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text('Payment Method', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
                      child: CheckboxListTile(
                        title: Text('Cash', style: GoogleFonts.poppins(fontSize: 16)),
                        value: _isChecked_cash,
                        onChanged: (bool value) {
                          setState(() {
                            _isChecked_cash = value;
                            _isChecked_nets = false;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
                      child: CheckboxListTile(
                        title: Text('NETS', style: GoogleFonts.poppins(fontSize: 18)),
                        value: _isChecked_nets,
                        onChanged: (bool value) {
                          setState(() {
                            _isChecked_nets = value;
                            _isChecked_cash = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              User.purchasedList.addAll(User.cartList);
              User.cartList.clear();
              User.cartNumList.clear();
              User.totalPrice = 0;
            });
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return MyBottomNavigationBar.other_index(1);
            }));
          },
          label: Text('Purchase', style: GoogleFonts.poppins(fontSize: 16)),
          backgroundColor: Colors.amber,
          icon: Icon(Icons.shopping_cart)
      ),
    );
  }
}

/*
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
 */