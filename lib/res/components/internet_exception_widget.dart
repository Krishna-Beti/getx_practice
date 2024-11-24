import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_off,color: Colors.red),
            SizedBox(height: 40.h,),
            Text("Unable to Connect, Please check\nthe Internet Connection.",textAlign: TextAlign.center,),
            SizedBox(height: 80.h,),
            ElevatedButton(onPressed: () {

            }, child: Text("Retry"))
          ],
        ),
      ),
    );
  }
}