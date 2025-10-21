import 'package:checkout_payment_ui/Features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/cubits/stripe_payment/stripe_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button_bloc_consumer.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 32),
          BlocProvider(
            create: (context) => StripePaymentCubit(CheckoutRepoImpl()),
            child: CustomButtomBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
