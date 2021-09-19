import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Ui {
  static GetBar SuccessSnackBar({String title = 'Success', String message}) {
    Get.log("[$title] $message");
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              .merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message,
          style: Get.textTheme.caption
              .merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Get.theme.accentColor,
      icon: Icon(Icons.check_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 5),
    );
  }

  static GetBar ErrorSnackBar(
      {String title = 'Something went wrong.', String message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              .merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text("Please check your internet connection!", //message,
          style: Get.textTheme.caption
              .merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }

  static BoxDecoration getBoxDecoration(
      {Color color, double radius, Border border, Gradient gradient}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(
            color: Colors.green.shade800.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5)),
      ],
      border:
          border ?? Border.all(color: Colors.green.shade800.withOpacity(0.05)),
      gradient: gradient,
    );
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      String errorText,
      IconData iconData,
      Widget suffixIcon,
      Widget suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Colors.green.shade800).marginOnly(right: 14)
          : SizedBox(),
      prefixIconConstraints: iconData != null
          ? BoxConstraints.expand(width: 38, height: 38)
          : BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(0),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  // static BoxFit getBoxFit(String boxFit) {
  //   switch (boxFit) {
  //     case 'cover':
  //       return BoxFit.cover;
  //     case 'fill':
  //       return BoxFit.fill;
  //     case 'contain':
  //       return BoxFit.contain;
  //     case 'fit_height':
  //       return BoxFit.fitHeight;
  //     case 'fit_width':
  //       return BoxFit.fitWidth;
  //     case 'none':
  //       return BoxFit.none;
  //     case 'scale_down':
  //       return BoxFit.scaleDown;
  //     default:
  //       return BoxFit.cover;
  //   }
  // }
  //
  // static AlignmentDirectional getAlignmentDirectional(
  //     String alignmentDirectional) {
  //   switch (alignmentDirectional) {
  //     case 'top_start':
  //       return AlignmentDirectional.topStart;
  //     case 'top_center':
  //       return AlignmentDirectional.topCenter;
  //     case 'top_end':
  //       return AlignmentDirectional.topEnd;
  //     case 'center_start':
  //       return AlignmentDirectional.centerStart;
  //     case 'center':
  //       return AlignmentDirectional.topCenter;
  //     case 'center_end':
  //       return AlignmentDirectional.centerEnd;
  //     case 'bottom_start':
  //       return AlignmentDirectional.bottomStart;
  //     case 'bottom_center':
  //       return AlignmentDirectional.bottomCenter;
  //     case 'bottom_end':
  //       return AlignmentDirectional.bottomEnd;
  //     default:
  //       return AlignmentDirectional.bottomEnd;
  //   }
  // }
  //
  // static CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
  //   switch (textPosition) {
  //     case 'top_start':
  //       return CrossAxisAlignment.start;
  //     case 'top_center':
  //       return CrossAxisAlignment.center;
  //     case 'top_end':
  //       return CrossAxisAlignment.end;
  //     case 'center_start':
  //       return CrossAxisAlignment.center;
  //     case 'center':
  //       return CrossAxisAlignment.center;
  //     case 'center_end':
  //       return CrossAxisAlignment.center;
  //     case 'bottom_start':
  //       return CrossAxisAlignment.start;
  //     case 'bottom_center':
  //       return CrossAxisAlignment.center;
  //     case 'bottom_end':
  //       return CrossAxisAlignment.end;
  //     default:
  //       return CrossAxisAlignment.start;
  //   }
  // }
}
