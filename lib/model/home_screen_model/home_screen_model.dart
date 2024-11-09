// To parse this JSON data, do
//
//     final listResProductAllMain = listResProductAllMainFromJson(jsonString);

import 'dart:convert';

List<ListResProductAllMain> listResProductAllMainFromJson(String str) =>
    List<ListResProductAllMain>.from(
        json.decode(str).map((x) => ListResProductAllMain.fromJson(x)));

String listResProductAllMainToJson(List<ListResProductAllMain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListResProductAllMain {
  String? id;
  String? name;
  Data? data;

  ListResProductAllMain({
    this.id,
    this.name,
    this.data,
  });

  factory ListResProductAllMain.fromJson(Map<String, dynamic> json) =>
      ListResProductAllMain(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? color;
  String? capacity;

  Data({
    this.color,
    this.capacity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
      };
}
