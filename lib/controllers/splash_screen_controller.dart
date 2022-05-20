import 'dart:async';
import 'package:get/get.dart';

import '../views/products_screen.dart';

class SplashScreenController extends GetxController {
  @override

  //Splash screen will last 3 seconds
  void onInit() {
    Timer(
        const Duration(seconds: 3),
            () => Get.to(
              () => const ProductsScreen(),
        ));
    super.onInit();
  }
}
