import 'package:flutter/material.dart';
import 'package:hng_ecommerce/main.dart';

class OrdersSuccessScreen extends StatelessWidget {
  const OrdersSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1B29),
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color(0xFF1F1B29), // Dark background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/check-out.png"),
              const SizedBox(height: 16),
              const Text(
                "Checkout Successfully Completed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
// Button color
                  backgroundColor: Color(0xff8E6CEF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  // Handlte button press
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomePage())));
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
