import 'package:flutter/material.dart';

class Burchasepage extends StatelessWidget {
  final double TotalAmount;
  const Burchasepage({super.key, required this.TotalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burchase Confirmation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/verified.gif",
              scale: 5,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Payment Successful",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Congratulations! your payment was successful"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total Amount purchased",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$$TotalAmount',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text("Go to Dashboard"))
          ],
        ),
      ),
    );
  }
}
