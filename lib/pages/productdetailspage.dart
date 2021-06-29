import 'package:flutter/material.dart';
import 'package:foodrush/pages/product.dart';
import 'package:foodrush/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(product);
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavourite = false;
  Product product;
  int quantity = 0;

  _ProductDetailsState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[850],
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 300,
                floating: true,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                      'images/${product.thumbnail}',
                      fit: BoxFit.contain
                  ),
                ),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  IconButton( // Report Button
                    icon: Icon(
                        Icons.report,
                        color: Colors.red
                    ),
                    onPressed: () {},
                  ),
                  IconButton( // Favourite Button
                    icon: Icon(
                        User.favouriteList.contains(product.productName)
                            ? Icons.favorite : Icons.favorite_border,
                        color: User.favouriteList.contains(product.productName)
                            ? Colors.red : Colors.black
                    ),
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                        isFavourite
                        ? User.favouriteList.add(product.productName)
                        : User.favouriteList.remove(product.productName);
                      });
                    },
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                    <Widget>[
                      Container(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                              product.productName,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.amber
                              )
                          )
                      ), // Food item
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                              "\$ ${product.price.toStringAsFixed(2)} / pkt",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: Colors.amber
                              )
                          )
                      ), // Price
                      SizedBox(height: 5), // Buffer
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('images/Profile pic.png'),
                              backgroundColor: Colors.grey[300],
                            ), // User profile pic
                            SizedBox(width: 7),
                            Text(
                              product.seller,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[850]
                              ),
                            ) // Username
                          ],
                        ), // User details
                      ),
                      SizedBox(height: 5), // Buffer
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10,
                            top: 5),
                        child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: ExpandablePanel(
                              header: Text(
                                  'Description',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[850]
                                  ),
                                  softWrap: true
                              ),
                              collapsed: Text(
                                  product.description,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[850]
                                  ),
                                  softWrap: true,
                                  maxLines: 1
                              ),
                              expanded: Text(
                                  product.description,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[850]
                                  ),
                                  softWrap: true
                              ),
                            )
                        ),
                      ), // Description Box
                      Container(
                          alignment: Alignment.centerRight,
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: IconButton(
                                icon: Icon(
                                  Icons.chat,
                                  size: 20,
                                ),
                                onPressed: () {}, // Chat button
                              )
                          )
                      ), // Chat Button
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Best before: '
                                '${DateFormat('dd/MM/yyyy').format(product.bestBefore)}',
                            style: GoogleFonts.poppins(
                                fontSize: 18
                            ),
                          )
                      ), // Expiry Date
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Collection point: ${product.collectionVenue}',
                            style: GoogleFonts.poppins(
                                fontSize: 18
                            ),
                          ) // Collection Point
                      ),
                      SizedBox(height: 150), // Buffer
                    ]
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 120, right: 120, bottom: 50),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) quantity -= 1;
                      });
                    },
                  ),
                  Text(
                    '$quantity',
                    style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                        Icons.add,
                        color: Colors.amber
                    ),
                    onPressed: () {
                      setState(() {
                        quantity += 1;
                      });
                    },
                  )
                ],
              ),
            ),
          ), // Floating purchase button
        ],
      ),
    );
  }
}