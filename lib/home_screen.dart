import 'package:flutter/material.dart';

import 'model/product.dart';
import 'product_card.dart';

class DahboardScreen extends StatefulWidget {
  const DahboardScreen({super.key});

  @override
  State<DahboardScreen> createState() => _DahboardScreenState();
}

class _DahboardScreenState extends State<DahboardScreen> {
  final List<Product> products = [
    Product(
      image: "assets/images/rec.png",
      title: "Men's Fleece Pullover Hoodie",
      price: "\$100.00",
    ),
    Product(
      image: "assets/images/rec2.png",
      title: "Fleece Pullover Skate Hoodie",
      price: "\$150.97",
    ),
    Product(
      image: "assets/images/rec3.png",
      title: "Fleece Skate Hoodie",
      price: "\$110.00",
    ),
    Product(
      image: "assets/images/rec4.png",
      title: "Men's Ice-Dye Pullover Hoodie",
      price: "\$128.97",
    ),
    // Add more products here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1B29),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
