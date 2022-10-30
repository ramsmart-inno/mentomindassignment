// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category(
      {required this.topicName,
      required this.concepts,
      required this.selected});

  String topicName;
  List<dynamic> concepts;
  bool selected;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        selected: false,
        topicName: json["topicName"],
        concepts: json["concepts"]
            .map((x) => Concept(conceptName: x, selected: false))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "topicName": topicName,
        "concepts": List<dynamic>.from(concepts.map((x) => x)),
      };
}

class Concept {
  Concept({required this.conceptName, required this.selected});

  String conceptName;
  bool selected;
}
