import 'package:get/get.dart';
import 'package:getx_practice/res/routes/route_names.dart';
import 'package:getx_practice/views/login/login_view.dart';
import 'package:getx_practice/views/splash_screen.dart';

import '../../views/home/home_view.dart';

class AppRoutes
{
  static appRoutes () => [
    GetPage(name: RouteNames.splashScreen, page: () => SplashScreen(),transition: Transition.leftToRightWithFade),
    GetPage(name: RouteNames.loginView, page: () => LoginView(),transition: Transition.rightToLeftWithFade),
    GetPage(name: RouteNames.homeView, page: () => HomeView(),transition: Transition.rightToLeftWithFade)
  ];
}