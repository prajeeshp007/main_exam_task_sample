// To parse this JSON data, do
//
//     final singleResProductAllMain = singleResProductAllMainFromJson(jsonString);

import 'dart:convert';

SingleResProductAllMain singleResProductAllMainFromJson(String str) =>
    SingleResProductAllMain.fromJson(json.decode(str));

String singleResProductAllMainToJson(SingleResProductAllMain data) =>
    json.encode(data.toJson());

class SingleResProductAllMain {
  String? id;
  String? name;
  Data? data;

  SingleResProductAllMain({
    this.id,
    this.name,
    this.data,
  });

  factory SingleResProductAllMain.fromJson(Map<String, dynamic> json) =>
      SingleResProductAllMain(
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
  int? year;
  double? price;
  String? cpuModel;
  String? hardDiskSize;

  Data({
    this.year,
    this.price,
    this.cpuModel,
    this.hardDiskSize,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        year: json["year"],
        price: json["price"]?.toDouble(),
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "price": price,
        "CPU model": cpuModel,
        "Hard disk size": hardDiskSize,
      };
}
