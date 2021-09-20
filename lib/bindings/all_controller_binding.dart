import 'package:get/get.dart';
import 'package:user_login/controllers/home_controller.dart';
import 'package:user_login/controllers/login_controller.dart';
import 'package:user_login/controllers/user_list_controller.dart';
import 'package:user_login/controllers/user_profile_controller.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<UserProfileController>(() => UserProfileController(),
        fenix: true);
    Get.lazyPut<UserListController>(() => UserListController(), fenix: true);
  }
}
