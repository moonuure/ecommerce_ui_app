import 'package:flutter/material.dart';
import '../Carts/models/cartClass.dart';
import '../Carts/screens/cartPage.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imagePath;
  final String heroTag; // Add heroTag property

  ProductDetailsPage({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.heroTag, // Initialize heroTag
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: heroTag, // Use the same tag here
                child: Image.asset(imagePath),
              ),
              SizedBox(height: 8.0),
              Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Text(description, style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 8.0),
              Text(price.toString(),
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add item to cart
                  Cart.cartItems.add(CartItem(
                    title: title,
                    imagePath: imagePath,
                    price: price,
                  ));

                  // Navigate to cart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
