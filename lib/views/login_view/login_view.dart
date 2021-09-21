import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_login/common_widgets/customLoader.dart';
import 'package:user_login/common_widgets/ui.dart';
import 'package:user_login/controllers/login_controller.dart';
import 'package:user_login/main.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.loginFormKey = new GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login".tr,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Form(
        key: controller.loginFormKey,
        child: ListView(
          primary: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade800.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 50),
                ),
                Container(
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Colors.white),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/Logo.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              if (controller.loading.isTrue)
                return Center(child: Loader().customLoader());
              else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 14, left: 20, right: 20),
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Email Address".tr,
                                style: Get.textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.text,
                                validator: (input) => !input.contains('@')
                                    ? "Should be a valid email".tr
                                    : null,
                                style: Get.textTheme.bodyText2,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                decoration: Ui.getInputDecoration(
                                  hintText: "kawsar@gmail.com".tr,
                                  iconData: Icons.alternate_email,
                                ),
                              ),
                            ],
                          ),
                          Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Password".tr,
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (input) => input.length < 6
                                      ? "Should be more than 6 characters".tr
                                      : null,
                                  style: Get.textTheme.bodyText2,
                                  obscureText: controller.hidePassword.value,
                                  textAlign: TextAlign.start,
                                  decoration: Ui.getInputDecoration(
                                    hintText: "••••••••••••".tr,
                                    iconData: Icons.lock_outline,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.hidePassword.value =
                                            !controller.hidePassword.value;
                                      },
                                      color: Colors.green.shade800,
                                      icon: Icon(controller.hidePassword.value
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade800,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (controller.loginFormKey.currentState
                                .validate()) {
                              print('validate');

                              controller.loginController(_emailController.text,
                                  _passwordController.text);
                            }
                          },
                          child: Text(
                            'Login',
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
          ],
        ),
      ),
    );
  }
}
