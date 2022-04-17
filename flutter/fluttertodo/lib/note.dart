import 'dart:convert';

class Note {
  int id;
  String body;
  Note({
    required this.id,
    required this.body,
  });

  Note copyWith({
    int? id,
    String? body,
  }) {
    return Note(
      id: id ?? this.id,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'body': body});

    return result;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id']?.toInt() ?? 0,
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() => 'Note(id: $id, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note && other.id == id && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ body.hashCode;
}
