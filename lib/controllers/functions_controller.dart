import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

//Instance of flutter secure storage
FlutterSecureStorage storage = const FlutterSecureStorage();

//SnackBar
class FunctionsController extends GetxController {
  void showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  //Storing user token
  Future<void> storeToken({required UserCredential credential}) async {
    await storage.write(key: 'userId', value: credential.user!.uid.toString());
  }

  //Retrieving user token
  Future<String?> getToken() async {
    return await storage.read(key: 'userId');
  }
}
