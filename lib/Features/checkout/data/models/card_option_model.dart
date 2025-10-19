
class CardOptions {
  final String? requestThreeDSecure;

  CardOptions({this.requestThreeDSecure});

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      requestThreeDSecure: json['request_three_d_secure'],
    );
  }

  Map<String, dynamic> toJson() => {
        'request_three_d_secure': requestThreeDSecure,
      };
}
