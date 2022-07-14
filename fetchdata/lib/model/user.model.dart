// To parse this JSON data, do
//
//     final dataResModel = dataResModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DataResModel dataResModelFromJson(String str) =>
    DataResModel.fromJson(json.decode(str));

String dataResModelToJson(DataResModel data) => json.encode(data.toJson());

class DataResModel {
  DataResModel({
    required this.data,
    required this.meta,
  });

  final Data data;
  final Meta meta;

  factory DataResModel.fromJson(Map<String, dynamic> json) => DataResModel(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.prize,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  final String name;
  final int prize;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        prize: json["prize"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "prize": prize,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
