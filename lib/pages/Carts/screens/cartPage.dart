import 'package:flutter/material.dart';
import '../models/cartClass.dart';
import 'CheckoutPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in Cart.cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: Cart.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = Cart.cartItems[index];
          return ListTile(
            leading: Image.asset(cartItem.imagePath),
            title: Text(cartItem.title),
            subtitle: Text('Price: \$${cartItem.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      cartItem.quantity++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
                Text(cartItem.quantity.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (cartItem.quantity > 1) {
                        cartItem.quantity--;
                      }
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    // Delete item from cart
                    Cart.cartItems.removeAt(index);
                    setState(() {}); // Refresh UI after removing item
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${calculateTotalPrice()}',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  // Get item titles
                  List<String> itemTitles = [];
                  for (var item in Cart.cartItems) {
                    itemTitles.add(item.title);
                  }

                  // Navigate to the checkout page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ),
                  ).then((value) {
                    setState(() {
                      Cart.cartItems.clear();
                    });
                  });
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
