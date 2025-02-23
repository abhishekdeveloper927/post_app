
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/controller/post_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //Repo

  //Controller
  Get.lazyPut(() => PostController());
}
