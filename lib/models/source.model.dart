// ignore_for_file: unnecessary_null_in_if_null_operators

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json["id"] ?? null, name: json["name"] ?? null);
  }
}
