// To parse this JSON data, do
//
//     final postIdModel = postIdModelFromJson(jsonString);

import 'dart:convert';

List<int> postIdModelFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));

String postIdModelToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
