import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/views/login_view/login_view.dart';

class Logout {
  logout() {
    SharedPreferences.getInstance().then((preference) {
      preference.clear();
      Get.offAll(LoginView());
    });
  }
}
