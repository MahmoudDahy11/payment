import 'amount_details_model.dart';
import 'automatic_payment_method_model.dart';
import 'payment_method_options_model.dart';

class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final AutomaticPaymentMethods? automaticPaymentMethods;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String status;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.livemode,
    required this.metadata,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.status,
    this.automaticPaymentMethods,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] ?? '',
      object: json['object'] ?? '',
      amount: json['amount'] ?? 0,
      amountCapturable: json['amount_capturable'] ?? 0,
      amountDetails: AmountDetails.fromJson(json['amount_details'] ?? {}),
      amountReceived: json['amount_received'] ?? 0,
      captureMethod: json['capture_method'] ?? '',
      clientSecret: json['client_secret'] ?? '',
      confirmationMethod: json['confirmation_method'] ?? '',
      created: json['created'] ?? 0,
      currency: json['currency'] ?? '',
      livemode: json['livemode'] ?? false,
      metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
      paymentMethodOptions: json['payment_method_options'] != null
          ? PaymentMethodOptions.fromJson(json['payment_method_options'])
          : null,
      paymentMethodTypes: List<String>.from(json['payment_method_types'] ?? []),
      status: json['status'] ?? '',
      automaticPaymentMethods: json['automatic_payment_methods'] != null
          ? AutomaticPaymentMethods.fromJson(json['automatic_payment_methods'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'amount': amount,
      'amount_capturable': amountCapturable,
      'amount_details': amountDetails.toJson(),
      'amount_received': amountReceived,
      'capture_method': captureMethod,
      'client_secret': clientSecret,
      'confirmation_method': confirmationMethod,
      'created': created,
      'currency': currency,
      'livemode': livemode,
      'metadata': metadata,
      'payment_method_options': paymentMethodOptions?.toJson(),
      'payment_method_types': paymentMethodTypes,
      'status': status,
      'automatic_payment_methods': automaticPaymentMethods?.toJson(),
    };
  }
}
