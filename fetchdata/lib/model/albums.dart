// To parse this JSON data, do
//
//     final albumsModel = albumsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AlbumsModel albumsModelFromJson(String str) =>
    AlbumsModel.fromJson(json.decode(str));

String albumsModelToJson(AlbumsModel data) => json.encode(data.toJson());

class AlbumsModel {
  AlbumsModel({
    required this.data,
    required this.meta,
  });

  final List<Datum> data;
  final Meta meta;

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    required this.albumName,
    this.duration,
    required this.artistName,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  final String albumName;
  final int? duration;
  final String artistName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        albumName: json["album_name"],
        duration: json["duration"],
        artistName: json["artist_name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "album_name": albumName,
        "duration": duration == null ? null : duration,
        "artist_name": artistName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  final Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
