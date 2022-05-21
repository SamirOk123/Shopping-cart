import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/resources/auth_methods.dart';
import 'package:coorgle_shopping_cart/views/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Variable to show loading indicator while logging in
  var isLoading = false.obs;

  //Dependency injection
  final functionsController = Get.put(FunctionsController());

  //Textfield controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Login user
  Future<void> loginUser(BuildContext context) async {
    isLoading.value = true;
    String result = await AuthMethods().loginUser(
        email: emailController.text, password: passwordController.text);
    if (result == 'Success') {
       Get.offAll(() =>  ProductsScreen());
    } else {
      functionsController.showSnackBar(context: context, content: result);
    }
    isLoading.value = false;
  }
}
