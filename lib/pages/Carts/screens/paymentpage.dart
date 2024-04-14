import 'package:ecommerce_ui_app/pages/Carts/screens/burchasepage.dart';
import 'package:flutter/material.dart';

import '../widgets/carddetails.dart';
import '../widgets/orderdetails.dart';
import '../widgets/paymentmethod.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;
  final int numberOfItems;
  final String shipment;
  final double discount;
  const PaymentPage(
      {super.key,
      required this.totalPrice,
      required this.numberOfItems,
      required this.shipment,
      required this.discount});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void _purchasePayment() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    await Future.delayed(Duration(seconds: 1), () {}).then((value) {
      Navigator.pop(context);
    });
    // so we need to solve this problem........
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Burchasepage(
                  TotalAmount: widget.totalPrice,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OrderDetails(
                    totalPrice: widget.totalPrice,
                    numberOfItems: widget.numberOfItems,
                    shipment: widget.shipment,
                    discount: widget.discount,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PaymentMethod(),
                  SizedBox(
                    height: 20,
                  ),
                  // Card feilds like name , number , expararion Date, and Cvv Code..

                  CardDetails(),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    // now we solved the problem.....
                    onPressed: _purchasePayment,
                    child: Text(
                      'Pay',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        backgroundColor: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
