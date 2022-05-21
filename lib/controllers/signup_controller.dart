import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //Variable to show loading indicator while signing up.
  var isLoading = false.obs;

  //Dependency injection
  final functionsController = Get.put(FunctionsController());

//Textfield controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Method to register user
  Future<void> signupUser(BuildContext context) async {
    isLoading.value = true;
    String result = await AuthMethods().signupUser(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text);
    isLoading.value = false;
    if (result != 'Success') {
      functionsController.showSnackBar(context: context, content: result);
    }
  }
}
