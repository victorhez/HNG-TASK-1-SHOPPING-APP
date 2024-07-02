import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/product.dart';

class ProductCard extends StatelessWidget {
  // final String image;
  final Product product;

  const ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2A35), // Slightly lighter than the background
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomMessage(
                        context, "${product.title} added to cart");
                    add_to_cart.add(product);
                  },
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

void showModalBottomMessage(BuildContext context, String message) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext context) {
      // Start a timer to close the bottom sheet after 3 seconds
      Timer(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });

      return Container(
        height: 100,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      );
    },
  );
}

List<Product> add_to_cart = [];
