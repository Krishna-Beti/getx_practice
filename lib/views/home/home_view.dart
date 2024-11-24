import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/res/routes/route_names.dart';
import 'package:getx_practice/view_models/controller/home/home_view_model.dart';
import 'package:getx_practice/view_models/controller/user_preference/user_preferences_view_model.dart';

import '../../data/response/status.dart';

class HomeView extends StatelessWidget {

  UserPreferences userPreferences = UserPreferences();
  final controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
        actions: [
          IconButton(onPressed: () {
            userPreferences.removeUser().then((value) {
              if(value)
                {
                  Get.offNamed(RouteNames.loginView);
                }
            });
          }, icon: Icon(Icons.login))
        ],
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text("Something went wrong"));
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: controller.userList.value.data!.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(controller.userList.value.data![index].firstName.toString()),
                  subtitle: Text(controller.userList.value.data![index].email.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(controller.userList.value.data![index].avatar.toString()),
                  ),
                ),
              );
            },);

        }
        return SizedBox();
      }),
    );
  }
}
