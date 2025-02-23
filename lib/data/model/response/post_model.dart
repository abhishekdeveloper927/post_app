// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

PostModel postNewModelFromJson(String str) =>
    PostModel.fromJson(json.decode(str));

String postNewModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  PostModel({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        by: json["by"],
        descendants: json["descendants"],
        id: json["id"],
        kids: json["kids"] == null
            ? []
            : List<int>.from(json["kids"]!.map((x) => x)),
        score: json["score"],
        time: json["time"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "descendants": descendants,
        "id": id,
        "kids": kids == null ? [] : List<dynamic>.from(kids!.map((x) => x)),
        "score": score,
        "time": time,
        "title": title,
        "type": type,
        "url": url,
      };
}
