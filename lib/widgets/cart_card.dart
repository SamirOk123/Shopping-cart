import 'package:coorgle_shopping_cart/controllers/cart_controller.dart';
import 'package:coorgle_shopping_cart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.controller,
    required this.index,
    required this.product,
  }) : super(key: key);

  final CartController controller;
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 20.h,
      width: MediaQuery.of(context).size.width - 10.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: -5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(product.imagePath),
                    )),
                width: 15.h,
                height: 15.h,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => controller.addProduct(product, context),
                child: const Icon(
                  Icons.add_circle,
                  color: Color(0xff1c8bc0),
                ),
              ),
              Text(
                controller.products.values.toList()[index].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => controller.removeProduct(product),
                child: const Icon(
                  Icons.remove_circle,
                  color: Color(0xff1c8bc0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
