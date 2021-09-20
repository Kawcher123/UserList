import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/common_widgets/ui.dart';
import 'package:user_login/main.dart';
import 'package:user_login/repositories/login_repository.dart';
import 'package:user_login/views/home_view/home_view.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey;
  final loading = false.obs;
  final hidePassword = true.obs;

  loginController(String email, String password) {
    loading.value = true;
    LoginRepository().login(email, password).then((value) {
      if (value != null) {
        SharedPreferences.getInstance().then((preferences) {
          preferences.setString('TOKEN', value['data']['token']);
        });
        print('hello');

        Get.off(HomeView());
      } else {
        loading.value = false;
        Get.showSnackbar(
            Ui.ErrorSnackBar(title: 'Login Error', message: 'User not found.'));
      }
    });
  }
}
