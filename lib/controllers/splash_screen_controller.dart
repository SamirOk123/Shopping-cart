import 'dart:async';
import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/views/login_screen.dart';
import 'package:coorgle_shopping_cart/views/products_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    //Splash screen will last 3 seconds
    Timer(const Duration(seconds: 3), () async {
      String result = await checkLogin();
      if (result == 'Success') {
        Get.offAll(ProductsScreen());
      } else {
        Get.offAll(LoginScreen());
      }
    });

    super.onInit();
  }

  //Dependency injection
  final functionsController = Get.put(FunctionsController());

  //Checking if user already logged in
  Future<String> checkLogin() async {
    String result = 'Some error occured';
    String? token = await functionsController.getToken();
    if (token != null) {
      result = 'Success';
      return result;
    } else {
      result = 'Failure';
      return result;
    }
  }
}
