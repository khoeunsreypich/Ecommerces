// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  List<Datum>? data;
  Meta? meta;

  Categories({
    this.data,
    this.meta,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datum {
  int? id;
  Attributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? iconUrl;

  Attributes({
    this.title,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.iconUrl,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    title: json["title"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    iconUrl: json["iconUrl"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "iconUrl": iconUrl,
  };
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

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
