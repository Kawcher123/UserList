import 'package:get/get.dart';
import 'package:user_login/controllers/login_controller.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
