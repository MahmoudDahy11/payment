import 'dart:developer';

import 'package:checkout_payment_ui/Features/checkout/data/models/ephemeral_keys_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/errors/custom_excption.dart';

class StripeSevice {
  final ApiService apiService = ApiService();

  /*
  * this method to create payment intent on stripe server
  * return PaymentIntentModel
   */
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentinputModel,
  ) async {
    var reponse = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentinputModel.toJson(),
      token: ApiKeys.stripeSecretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(reponse.data);
    return paymentIntentModel;
  }

  /*
  * this method to initialize payment sheet on stripe server
  *  paymentIntentClientSecret from createPaymentIntent method 
   */
  Future<void> initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        merchantDisplayName: 'Dahy',
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  /*
  * this method to present payment sheet on stripe server 
  * display the payment sheet to user
   */

  Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {

      if (e.error.code == FailureCode.Canceled) {
        throw CustomException(errMessage: 'Payment canceled by user');
      } else {
        throw CustomException(
          errMessage: e.error.localizedMessage ?? 'Stripe payment failed',
        );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }

  /*
  * this method to make payment 
  * call createPaymentIntent , initPaymentSheet , presentPaymentSheet methods
  */

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentinputModel,
  }) async {
    try {
      var paymentIntentModel = await createPaymentIntent(
        paymentIntentinputModel,
      );
      var ephemeralKeysModel = await createEphemeralkeys(
        customerId: paymentIntentinputModel.customerId,
      );
      var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret,
        ephemeralKeySecret: ephemeralKeysModel.secret,
      );
      await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel,
      );
      await presentPaymentSheet();
    } on StripeException catch (e) {
 
      if (e.error.code == FailureCode.Canceled) {
        log('⚠️ Payment flow canceled by user');
        return; 
      }
      log('❌ Stripe Exception during payment: ${e.error.localizedMessage}');
      rethrow;
    } catch (e) {
      log('Unexpected error during makePayment: $e');
      rethrow;
    }
  }

  Future<EphemeralKeysModel> createEphemeralkeys({
    required String customerId,
  }) async {
    var reponse = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      token: ApiKeys.stripeSecretKey,
      headers: {
        'Stripe-Version': '2025-09-30.clover',
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
      },
    );
    var ephemeralKeysModel = EphemeralKeysModel.fromJson(reponse.data);
    return ephemeralKeysModel;
  }
}
