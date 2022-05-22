import 'package:coorgle_shopping_cart/controllers/login_controller.dart';
import 'package:coorgle_shopping_cart/instances.dart';
import 'package:coorgle_shopping_cart/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/login.png', width: 60.w),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 25.sp),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: loginController.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email ID',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextField(
                    controller: loginController.passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.key),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(
                    () => MaterialButton(
                      onPressed: () {
                        loginController.loginUser(context);
                      },
                      color: const Color(0xff1c8bc0),
                      elevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      minWidth: double.infinity,
                      height: 6.h,
                      child: loginController.isLoading.value == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New to Coorgle? ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => SignupScreen()),
                        child: Text(
                          'Register',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: const Color(0xff1c8bc0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
