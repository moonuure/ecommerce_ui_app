class CartItem {
  final String title;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.imagePath,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });
}


class Cart {
  static List<CartItem> cartItems = [];
}
