import 'package:flutter/material.dart';
import '../Carts/screens/cartPage.dart';
import '../widgets/advertisement_card.dart';
import '../widgets/product_grid.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Searching part.......
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Type here to find",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onChanged: (value) {
                  // in here we implementing searching functionality...
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Adverticements",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AdvertisementCard(
                title: "Shoes",
                description:
                    "Today is Over Day intil 5:00PM Oclock! please isit..",
                price: "FREE",
                imageUrl: "images/4.png"),

            SizedBox(
              height: 10,
            ),
            ProductGridView()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.red.shade200,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.grey,
            ),
            label: "Favorate",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Icon(
                Icons.shopping_cart_checkout,
                size: 30,
                color: Colors.grey,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.grey,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
