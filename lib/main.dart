import 'package:checkout_payment_ui/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCartView(),
        ThankYouView.id: (context) => const ThankYouView(),
      },
      // home: MyCartView(),
    );
  }
}


//Stripe Steps  
// create payment intent (ammount, currency , customerId)  
// craete EphemeralKey(customerId)
// init payment sheet (merchantName, paymentIntentClientSecret, ephemeralKeySecret)
// present payment sheet