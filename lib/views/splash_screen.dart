import 'package:flutter/material.dart';
import 'package:getx_practice/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    services.isUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Center(
        child: Text("Welcome Back!"),
      ),
    );
  }
}
