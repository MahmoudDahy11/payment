
class AutomaticPaymentMethods {
  final bool enabled;

  AutomaticPaymentMethods({required this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(enabled: json['enabled'] ?? false);
  }

  Map<String, dynamic> toJson() => {'enabled': enabled};
}
