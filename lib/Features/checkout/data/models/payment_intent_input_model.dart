class PaymentIntentInputModel {
  final num amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    final int convertedAmount = (amount * 100).round();

    return {
      'amount': convertedAmount,
      'currency': currency,
      'customer': customerId,
    };
  }
}
