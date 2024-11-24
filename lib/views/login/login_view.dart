import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_practice/view_models/controller/login/login_view_model.dart';

class LoginView extends StatelessWidget {

  final controller = Get.put(LoginViewModel());
  final LoginViewModel model = LoginViewModel();
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(
                  hintText: "Enter Email"
                ),
              ),
            TextFormField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(
                  hintText: "Enter Password"
                ),
              ),
            ElevatedButton(onPressed: () {
              // if(_formKey.currentState!.validate())
              // {
              //   print(controller.emailController.value.text.toString());
              //   print(controller.passwordController.value.text.toString());
              //   model.loginApi();
              // }
              Map data={
                'email': controller.emailController.value.text.trim(),
                'password': controller.passwordController.value.text.trim()
              };
                model.loginApi(data);
            }, child: Obx(()=>controller.loading.value?CircularProgressIndicator():Text("Login"))),
          ],
        ),
      ),
    );
  }
}
