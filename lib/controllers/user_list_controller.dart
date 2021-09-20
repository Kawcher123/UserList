import 'package:get/get.dart';
import 'package:user_login/common_widgets/logout.dart';
import 'package:user_login/models/user_list_model.dart';
import 'package:user_login/repositories/user_list_repository.dart';

class UserListController extends GetxController {
  Rx<UserListModel> userList = UserListModel().obs;
  RxBool userListDataLoaded = false.obs;

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  @override
  void dispose() {
    userList = UserListModel().obs;
    super.dispose();
  }

  void getUserList() {
    UserListRepository().getUserList().then((response) {
      if (response != null) {
        userList.value = response;
        userListDataLoaded.value = true;
      } else {
        Logout().logout();
      }
    });
  }
}
