import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String? _selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPaymentMethod(
            icon: Icons.credit_card,
            title: "Credit Card",
            isSelected: _selectedPaymentMethod == "Credit Card"),
        _buildPaymentMethod(
            icon: Icons.credit_card,
            title: "Paypal Way",
            isSelected: _selectedPaymentMethod == "Paypal method"),
        _buildPaymentMethod(
            icon: Icons.credit_card,
            title: "Other Way",
            isSelected: _selectedPaymentMethod == "Other method"),
      ],
    );
  }

  Widget _buildPaymentMethod({
    required IconData icon,
    required String title,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : null,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(color: isSelected ? Colors.blue : null),
              )
            ],
          ),
        ),
      ),
    );
  }
}
