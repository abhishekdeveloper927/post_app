import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';

class Button2 extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData? icon;
  final Color? borderColor;
  final double? width;
  final double? radius;
  final double? padding;
  final double? fontSize;

  const Button2(
      {super.key,
      required this.title,
      required this.onTap,
      this.width,
      this.radius,
      this.padding,
      this.fontSize,
      this.icon,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width ?? Get.width,
        padding: EdgeInsets.all(padding ?? Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(
            radius ?? Dimensions.paddingSizeDefault,
          ),
          border: Border.all(
            color: borderColor ?? Get.theme.cardColor,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? Dimensions.fontSizeDefault),
          ),
        ),
      ),
    );
  }
}
