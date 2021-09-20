import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/common_widgets/customLoader.dart';
import 'package:user_login/main.dart';
import 'package:user_login/views/home_view/home_view.dart';
import 'package:user_login/views/login_view/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splashScreen';
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  Animation animation1, animation2;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => goTo());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Center(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage(
                  'assets/Logo.png',
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Loader().customLoader(context),
            )
          ],
        ),
      ),
    );
  }

  void goTo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('TOKEN');

    if (token != null) {
      Get.off(HomeView());
    } else {
      Get.off(() => LoginView());
    }
  }
}
