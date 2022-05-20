import 'dart:async';
import 'package:coorgle_shopping_cart/views/products_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    //Splash screen will last 3 seconds
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => const ProductsScreen(),
      ),
    );
    super.onInit();
  }
}
