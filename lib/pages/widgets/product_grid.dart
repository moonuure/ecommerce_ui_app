import 'ProductDetailsPage.dart';
import 'package:flutter/material.dart';
import 'transparent_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 700),
                      pageBuilder: ((context, animation, secondaryAnimation) {
                        return ProductDetailsPage(
                          title: 'Shoes ${index + 1}',
                          description:
                              'Elevate your runs with these sleek and breathable running shoes. Engineered for comfort and performance, they feature advanced cushioning and a lightweight design. Perfect for casual jogs or intense workouts, these shoes offer durability and style in every step. ${index + 1}.',
                          price: (index + 1 * 8).toDouble(),
                          imagePath: 'images/${index + 1}.png',
                          heroTag: 'images/${index + 1}.png',
                        );
                      })));
            },
            child: Hero(
              tag: 'images/${index + 1}.png',
              child: Transparent_Card(
                title: 'Shoes ${index + 1}',
                description: 'Best Shoes in 2024. ${index + 1}.',
                price: '\$${(index + 1 * 5)}',
                imagePath: 'images/${index + 1}.png',
              ),
            ),
          );
        },
      ),
    );
  }
}
