import 'package:flutter/material.dart';
import '../models/cartClass.dart';
import 'paymentpage.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    double total = 0.0;
    for (var item in Cart.cartItems) {
      total += item.price * item.quantity;
    }
    // Apply discount
    total -= total * 0.05;
    setState(() {
      _totalPrice = total;
    });
  }

  void _buyButtonPressed() {
    // Navigate to the purchase confirmation screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaymentPage(
                  totalPrice: _totalPrice,
                  numberOfItems: Cart.cartItems.length,
                  shipment: "Standard",
                  discount: _totalPrice * 0.05,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        actions: [
          IconButton(
            onPressed: () {
              // Perform checkout action
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: Cart.cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = Cart.cartItems[index];
                            return ListTile(
                              title: Text(cartItem.title),
                              trailing: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    // Decrease total price
                                    _totalPrice -= cartItem.price;
                                    _totalPrice = 0;
                                    // Remove item from cart
                                    Cart.cartItems.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Total: \$${_totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Discount: \$${(_totalPrice * 0.05).toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              // wee need to add Loading clicking this button
              onPressed: _buyButtonPressed,
              child: Text('Buy'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
