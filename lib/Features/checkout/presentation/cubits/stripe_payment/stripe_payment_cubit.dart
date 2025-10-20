import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripePaymentLoading());
    var result = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (failure) => emit(StripePaymentFailure(errMessage: failure.errMessage)),
      (_) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('${change.currentState} -> ${change.nextState}');
    super.onChange(change);
  }
}
