import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Ui {
  static GetBar ErrorSnackBar(
      {String title = 'Something went wrong.', String message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6.merge(TextStyle(color: Colors.white))),
      messageText: Text(message.tr, //message,
          style: Get.textTheme.caption.merge(TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: Colors.white),
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
}
