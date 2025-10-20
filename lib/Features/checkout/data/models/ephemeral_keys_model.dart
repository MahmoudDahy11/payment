class EphemeralKeysModel {
  final String id;
  final String object;
  final List<AssociatedObject> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKeysModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKeysModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeysModel(
      id: json['id'] ?? '',
      object: json['object'] ?? '',
      associatedObjects:
          (json['associated_objects'] as List<dynamic>?)
              ?.map((e) => AssociatedObject.fromJson(e))
              .toList() ??
          [],
      created: json['created'] ?? 0,
      expires: json['expires'] ?? 0,
      livemode: json['livemode'] ?? false,
      secret: json['secret'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'associated_objects': associatedObjects.map((e) => e.toJson()).toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}

class AssociatedObject {
  final String id;
  final String type;

  AssociatedObject({required this.id, required this.type});

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(id: json['id'] ?? '', type: json['type'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'type': type};
  }
}
