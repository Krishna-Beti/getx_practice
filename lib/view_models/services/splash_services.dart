import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_practice/res/routes/route_names.dart';
import 'package:getx_practice/view_models/controller/user_preference/user_preferences_view_model.dart';

class SplashServices
{

  UserPreferences userPreferences = UserPreferences();
  void isUserLogin(){

    userPreferences.getUser().then((value) {
      if(value.token!.isEmpty || value.token.toString() =="null")
        {
          Timer(Duration(seconds: 3), () {
            Get.offNamed(RouteNames.loginView);
          });
        }
      else{
        Timer(Duration(seconds: 3), () {
          Get.offNamed(RouteNames.homeView);
        });
      }
    });

  }
}