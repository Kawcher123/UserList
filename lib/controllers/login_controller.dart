import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey;
  final loading = false.obs;
  final hidePassword = true.obs;
}
