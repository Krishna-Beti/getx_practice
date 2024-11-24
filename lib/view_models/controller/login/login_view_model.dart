import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/models/login/user_model.dart';
import 'package:getx_practice/repository/login_repository/login_repository.dart';
import 'package:getx_practice/res/routes/route_names.dart';
import 'package:getx_practice/view_models/controller/user_preference/user_preferences_view_model.dart';

class LoginViewModel extends GetxController{

  UserPreferences userPreferences =  UserPreferences();
  final _api=LoginRepository();
  RxBool loading=false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  void loginApi(Map data)
  {
    _api.loginApi(data).then((value) {
      if(value.containsKey("error"))
        {
          Get.snackbar("Warning", "Invalid Credentials");
        }
      else
        {
          userPreferences.saveUser(UserModel.fromJson(value));
          Get.offNamed(RouteNames.homeView);
        }
    },).onError((error, stackTrace){
      print("Error : $error");
    });
    loading.value=false;
  }

}