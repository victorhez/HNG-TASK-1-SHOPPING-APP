import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hng_ecommerce/product_card.dart';

import 'model/product.dart';
import 'order_success_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1B29),
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: add_to_cart.isEmpty
          ? const Center(
              child: Text(
                "No Item to checkout!",
                style: TextStyle(color: Colors.white),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: add_to_cart.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        order: add_to_cart[index],
                        onRemove: () {
                          showModalBottomMessage(context,
                              "${add_to_cart[index].title} removed from cart");
                          setState(() {
                            add_to_cart.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
// Button color
                    backgroundColor: Color(0xff8E6CEF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    // Handlte button press
                    add_to_cart.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => OrdersSuccessScreen())));
                  },
                  child: const Text(
                    "Checkout Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
      backgroundColor: Color(0xFF1F1B29), // Dark background color
    );
  }
}

class OrderCard extends StatelessWidget {
  final Product order;
  final VoidCallback onRemove;
  const OrderCard({required this.order, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2D2A35), // Slightly lighter than the background
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: Image.asset(order.image),
          title: Text(
            order.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "\$ ${order.price}",
            style: TextStyle(color: Colors.white70),
          ),
          trailing: GestureDetector(
              onTap: onRemove,
              child: const Icon(Icons.cancel, color: Colors.white)),
        ),
      ),
    );
  }
}
