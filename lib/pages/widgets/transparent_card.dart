import 'package:flutter/material.dart';

import '../Carts/models/cartClass.dart';

class Transparent_Card extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String imagePath;
  const Transparent_Card({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  State<Transparent_Card> createState() => _Transparent_CardState();
}

class _Transparent_CardState extends State<Transparent_Card> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.imagePath,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Expanded(
              child: Text(
                widget.description,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price,
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite) {
                            Cart.cartItems.add(CartItem(
                                title: widget.title,
                                imagePath: widget.imagePath,
                                price: double.parse(widget.price.substring(1)),
                                quantity: 1));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Added to cart"),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            Cart.cartItems.removeWhere(
                                (element) => element.title == widget.title);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Removed from cart"),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
