import 'dart:developer';

import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/cubits/stripe_payment/stripe_payment_cubit.dart';
import 'package:checkout_payment_ui/core/helper/show_snak_bar.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../thank_you_view.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacementNamed(ThankYouView.id);
        } else if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          showSnakBar(context, state.errMessage, isError: true);
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: 100.2,
                  currency: "USD",
                  customerId: ApiKeys.customerId,
                );
            BlocProvider.of<StripePaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is StripePaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
