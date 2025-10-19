import 'package:checkout_payment_ui/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}


/*
 * Stripe Steps
 * 1. Create Stripe Account
 * 2. PaymentIntentObject <-  create paymentIntent (ammount, currency)  // backend
 * 3. initialize payment sheet(paymentIntentClientSecret) // frontend
 * present payment sheet // frontend
 */ 