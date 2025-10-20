import 'package:checkout_payment_ui/core/utils/api_keys.dart';

class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String ephemeralKeySecret;
  final String customerId = ApiKeys.customerId ;

  InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    required this.ephemeralKeySecret,
    
  });

}
