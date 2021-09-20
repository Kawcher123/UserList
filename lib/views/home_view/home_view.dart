import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_login/controllers/home_controller.dart';
import 'package:user_login/views/user_list_view/user_list_view.dart';
import 'package:user_login/views/user_profile_view/user_profile.dart';

class HomeView extends GetView<HomeController> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[UserListView(), UserProfile()];

  void _onItemTapped(int index) {
    controller.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Center(
        child: _widgetOptions.elementAt(controller.selectedIndex.value),
      );
    }), bottomNavigationBar: Obx(() {
      return BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.green.shade800,
        onTap: _onItemTapped,
        currentIndex: controller.selectedIndex.value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        items: [
          _bottomNavigationBarItem(
            icon: CupertinoIcons.home,
            label: 'Home',
          ),
          _bottomNavigationBarItem(
            icon: CupertinoIcons.person,
            label: 'Account',
          ),
        ],
      );
    }));
  }

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
