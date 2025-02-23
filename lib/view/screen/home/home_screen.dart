import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/controller/post_controller.dart';
import 'package:post_app/helper/loader.dart';
import 'package:post_app/util/dimensions.dart';
import 'package:post_app/view/base/button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<PostController>().getPostIds();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        centerTitle: true,
        title: Text(
          "All Post",
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<PostController>(
        builder: (postController) {
          if (postController.isLoading) {
            return const Loader();
          }
          if (postController.postList.isEmpty) {
            return Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              itemCount: postController.postList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      bottom: Dimensions.paddingSizeDefault),
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 3)
                      ],
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postController.postList[index].type!.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeDefault),
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        postController.postList[index].title ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeDefault),
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        "By : ${postController.postList[index].by ?? ""}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        "Score : ${postController.postList[index].score ?? ""}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      Button(
                        title: "Launch Url",
                        onTap: () {
                          openWeb(postController.postList[index].url ?? "");
                        },
                        width: 100,
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  openWeb(String myUrl) async {
    Uri url = Uri.parse(myUrl);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
