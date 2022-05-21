import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coorgle_shopping_cart/controllers/functions_controller.dart';
import 'package:coorgle_shopping_cart/views/products_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthMethods {
  //Dependency injection
  final functionsController = Get.put(FunctionsController());
  //Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Signup User
  Future<String> signupUser(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    String result = 'Some error occured';
    try {
      if (name.isNotEmpty ||
          phone.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty) {
        //Registering user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
           

        //Adding user to database
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'name': name,
          'phone': phone,
          'email': email,
        });
        result = 'Success';
        functionsController.storeToken(credential: credential);
        Get.offAll(ProductsScreen());
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  //Login user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
      UserCredential credential=  await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'Success';
        functionsController.storeToken(credential: credential);
      } else {
        result = 'Please fill all the fields';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  //Logout user
  Future<void> logoutUser ()async{
    await _auth.signOut();
    await storage.delete(key: 'userId');
  }
}
