import 'package:coorgle_shopping_cart/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  //Dependency Injection
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo_tag',
          child: Image.asset('assets/images/logo.png',
              width: MediaQuery.of(context).size.width - 20.w),
        ),
      ),
    );
  }
}
