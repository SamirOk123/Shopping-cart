import 'package:coorgle_shopping_cart/resources/auth_methods.dart';
import 'package:coorgle_shopping_cart/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                      "assets/images/user.jpg",
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser!.email!.split('@').first,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            onTap: () async {
              await AuthMethods().logoutUser();
              Get.offAll(LoginScreen());
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
