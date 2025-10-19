import 'card_option_model.dart';
import 'link_option_model.dart';

class PaymentMethodOptions {
  final CardOptions? card;
  final LinkOptions? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] != null ? CardOptions.fromJson(json['card']) : null,
      link: json['link'] != null ? LinkOptions.fromJson(json['link']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'card': card?.toJson(),
    'link': link?.toJson(),
  };
}
