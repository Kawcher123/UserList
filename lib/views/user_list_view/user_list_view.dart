import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:user_login/controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'User List',
          style: TextStyle(color: Colors.green.shade800),
        ),
      ),
      body: Obx(() {
        if (controller.userListDataLoaded.value == false) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.green.shade800,
          ));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: List.generate(controller.userList.value.data.length,
                    (index) {
                  return Container(
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
                    child: ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text(
                          controller.userList.value.data[index].name ?? ''),
                    ),
                  );
                }),
              ),
            ),
          );
        }
      }),
    );
  }
}
