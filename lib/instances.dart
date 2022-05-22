
  import 'package:coorgle_shopping_cart/controllers/cart_controller.dart';
import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/controllers/login_controller.dart';
import 'package:coorgle_shopping_cart/controllers/signup_controller.dart';
import 'package:coorgle_shopping_cart/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

final functionsController = Get.put(FunctionsController());

  final loginController = Get.put(LoginController());
   final cartController = Get.put(CartController());
   final signupController = Get.put(SignupController());
