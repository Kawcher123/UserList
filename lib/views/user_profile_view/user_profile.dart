import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/common_widgets/logout.dart';
import 'package:user_login/common_widgets/ui.dart';
import 'package:user_login/controllers/user_profile_controller.dart';
import 'package:user_login/views/login_view/login_view.dart';

class UserProfile extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.userDataLoaded.value == false) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.green.shade800,
          ));
        } else {
          return ListView(
            primary: true,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Color.fromRGBO(112, 112, 112, .3),
                                width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                              child: controller.userData.value.data.userImage ==
                                      null
                                  ? Image(
                                      color: Colors.black,
                                      image: AssetImage(
                                        'assets/Logo.png',
                                      ),
                                      fit: BoxFit.fill,
                                    )
                                  : FadeInImage.assetNetwork(
                                      placeholder: 'assets/man.png',
                                      image:
                                          'http://202.53.174.5:4115/${controller.userData.value.data.userImage}',
                                      fit: BoxFit.fill,
                                    )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          controller.userData.value.data.name ?? "--",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          controller.userData.value.data.designationsName ??
                              "--",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                        ),
                      ),
                    ],
                  )),
              buildCountersRow(),
              SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade800.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                    border: Border.all(
                        color: Colors.green.shade800.withOpacity(0.05))),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "About".tr,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image(
                              height: 30,
                              width: 40,
                              image: AssetImage('assets/des.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userData.value.data.designationsName ??
                                  '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 30,
                              width: 40,
                              image: AssetImage('assets/dep.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userData.value.data.departmentsName ??
                                  '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 30,
                              width: 40,
                              image: AssetImage('assets/branch.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userData.value.data.branchsName ?? '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade800.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                    border: Border.all(
                        color: Colors.green.shade800.withOpacity(0.05))),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Contact Details".tr,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image(
                              height: 30,
                              width: 40,
                              image: AssetImage('assets/gmail.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userData.value.data.email ?? '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 30,
                              width: 40,
                              image: AssetImage('assets/phones.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.userData.value.data.mobile ??
                                  '+880**********',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade800,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Logout().logout();
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  buildCountersRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                controller.userData.value.data.bloodGroup ?? "--",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Blood Group",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                controller.userData.value.data.gender ?? "--",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
