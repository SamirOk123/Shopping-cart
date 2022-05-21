import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //Dependency injection
  final functionsController = Get.put(FunctionsController());

//Map to store products in the cart
  var products = {}.obs;

  //Function to add product to the cart
  void addProduct(Product product, BuildContext context) {
    if (products.containsKey(product)) {
      products[product] += 1;
    } else {
      products[product] = 1;
    }
    functionsController.showSnackBar(
        context: context, content: '${product.name} added to the cart');
  }

  //Remove product from cart
  void removeProduct(Product product) {
    if (products.containsKey(product) && products[product] == 1) {
      products.removeWhere((key, value) => key == product);
    } else {
      products[product] -= 1;
    }
  }

//Getting total price
  get total => products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
