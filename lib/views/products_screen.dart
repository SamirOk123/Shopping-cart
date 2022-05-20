import 'package:coorgle_shopping_cart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/menu.png',
            height: 6.h,
            width: 6.w,
          ),
        ),
        title: Hero(
            tag: 'logo_tag',
            child: Image.asset(
              'assets/images/logo.png',
              width: 40.w,
            )),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/shopping-cart.png',
              width: 6.w,
              height: 6.h,
            ),
          ),
        ],
      ),
      body: StaggeredGridView.countBuilder(
        padding:
            const EdgeInsets.only(right: 10, left: 10, bottom: 20, top: 10),
        crossAxisCount: 2,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        crossAxisSpacing: 0,
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 8,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return buildImageCard(index);
        },
      ),
    );
  }

  //Function to create card for grid view
  Widget buildImageCard(int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
             products[index].imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          width: 1000,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                products[index].name,
                style: GoogleFonts.inter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$'+products[index].price,
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/icons/add-to-cart.png',
                    width: 6.w,
                    height: 6.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
