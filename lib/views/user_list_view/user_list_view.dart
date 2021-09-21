import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:user_login/common_widgets/customLoader.dart';
import 'package:user_login/controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  Future<void> _onRefresh() async {
    controller.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Employees',
          style: TextStyle(color: Colors.green.shade800),
        ),
      ),
      body: Obx(() {
        if (controller.userListDataLoaded.value == false) {
          return Center(child: Loader().customLoader());
        } else {
          return RefreshIndicator(
            color: Colors.green.shade800,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: List.generate(controller.userList.value.data.length,
                      (index) {
                    return Container(
                        height: MediaQuery.of(context).size.width * .43,
                        padding: EdgeInsets.only(
                            top: 20, bottom: 14, left: 15, right: 15),
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
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
                                color:
                                    Colors.green.shade800.withOpacity(0.05))),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  child: controller.userList.value.data[index]
                                              .userImage ==
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
                                              'http://202.53.174.5:4115/${controller.userList.value.data[index].userImage}',
                                          fit: BoxFit.fill,
                                        )),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.userList.value.data[index]
                                                  .name ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: controller.userList.value
                                                      .data[index].status ==
                                                  'Active'
                                              ? Colors.green
                                              : Colors.red,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        controller.userList.value.data[index]
                                                    .designationsName !=
                                                null
                                            ? Text(
                                                controller
                                                    .userList
                                                    .value
                                                    .data[index]
                                                    .designationsName,
                                              )
                                            : Wrap(),
                                        controller.userList.value.data[index]
                                                    .email !=
                                                null
                                            ? Text(
                                                '${controller.userList.value.data[index].email}',
                                              )
                                            : Wrap(),
                                        Divider(
                                          // color: Colors.black,
                                          thickness: 1,
                                        ),
                                        controller.userList.value.data[index]
                                                    .departmentsName !=
                                                null
                                            ? Text(
                                                'Department: ${controller.userList.value.data[index].departmentsName}')
                                            : Wrap(),
                                        controller.userList.value.data[index]
                                                    .branchsName !=
                                                null
                                            ? Text(
                                                'Branch Name: ${controller.userList.value.data[index].branchsName}')
                                            : Wrap(),
                                        controller.userList.value.data[index]
                                                    .bloodGroup !=
                                                null
                                            ? Text(
                                                'Blood Group: ${controller.userList.value.data[index].bloodGroup}')
                                            : Wrap(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                  }),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
