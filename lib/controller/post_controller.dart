import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/data/model/response/post_id_model.dart';
import 'package:post_app/data/model/response/post_model.dart';

class PostController extends GetxController implements GetxService {
  PostController();

  bool isLoading = false;
  List<int> postIdList = [];
  PostModel? postModel;
  List<PostModel> postList = [];

  Future<http.Response> getPostIds() async {
    isLoading = true;
    http.Response response = await http.get(Uri.parse(
        "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"));

    if (response.statusCode == 200) {
      isLoading = false;
      postIdList = postIdModelFromJson(response.body);
      if (postIdList.isNotEmpty) {
        for (var i in postIdList) {
          await getPostById(i);
        }
      }
      print(jsonEncode(postIdList));
    } else {
      isLoading = false;
      throw Exception('Failed to  data');
    }
    update();
    return response;
  }

  Future<http.Response> getPostById(int id) async {
    postModel = null;
    http.Response response = await http.get(Uri.parse(
        "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty"));

    if (response.statusCode == 200) {
      isLoading = false;
      postModel = postNewModelFromJson(response.body);
      if (postModel != null) {
        postList.add(postModel!);
        print(jsonEncode(postList));
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load  data');
    }
    update();
    return response;
  }
}
