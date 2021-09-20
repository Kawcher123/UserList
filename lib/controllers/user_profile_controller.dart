import 'package:get/get.dart';
import 'package:user_login/common_widgets/logout.dart';
import 'package:user_login/models/user_model.dart';
import 'package:user_login/repositories/user_profile_repository.dart';
import 'package:user_login/views/login_view/login_view.dart';

class UserProfileController extends GetxController {
  Rx<UserModel> userData = UserModel().obs;
  RxBool userDataLoaded = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getProfileData();
    super.onInit();
  }

  getProfileData() {
    UserProfileRepository().getUserData().then((response) {
      if (response != null) {
        userData.value = response;
        userDataLoaded.value = true;
      } else {
        Logout().logout();
      }
    });
  }
}
