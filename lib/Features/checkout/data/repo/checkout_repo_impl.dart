import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/service/stripe_sevice.dart';
import 'package:checkout_payment_ui/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:checkout_payment_ui/core/errors/custom_excption.dart';
import 'package:checkout_payment_ui/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeSevice _stripeSevice = StripeSevice();
  @override
  Future<Either<CustomFailure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await _stripeSevice.makePayment(
        paymentIntentinputModel: paymentIntentInputModel,
      );
      return right(null);
    } on CustomException catch (ex) {
      return Left(CustomFailure(errMessage: ex.errMessage));
    }
  }
}
