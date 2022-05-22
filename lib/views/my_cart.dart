import 'package:coorgle_shopping_cart/controllers/cart_controller.dart';
import 'package:coorgle_shopping_cart/instances.dart';
import 'package:coorgle_shopping_cart/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(
            () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: cartController.products.length,
              itemBuilder: (context, index) {
                return CartCard(
                    controller: cartController,
                    product: cartController.products.keys.toList()[index],
                    index: index);
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Container(
              height: 7.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.black),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Obx(
                  () => Text(
                    cartController.products.isEmpty
                        ? 'Total  \$0'
                        : 'Total  \$${cartController.total.toString()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
