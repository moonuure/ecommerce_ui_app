import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  final double totalPrice;
  final int numberOfItems;
  final String shipment;
  final double discount;
  const OrderDetails(
      {super.key,
      required this.totalPrice,
      required this.numberOfItems,
      required this.shipment,
      required this.discount});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Order Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Items",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${widget.numberOfItems}')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 6,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "price",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${widget.totalPrice.toStringAsFixed(2)}',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "shipment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.shipment}',
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${widget.discount.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
