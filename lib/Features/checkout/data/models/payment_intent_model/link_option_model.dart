
class LinkOptions {
  final String? persistentToken;

  LinkOptions({this.persistentToken});

  factory LinkOptions.fromJson(Map<String, dynamic> json) {
    return LinkOptions(persistentToken: json['persistent_token']);
  }

  Map<String, dynamic> toJson() => {
        'persistent_token': persistentToken,
      };
}
