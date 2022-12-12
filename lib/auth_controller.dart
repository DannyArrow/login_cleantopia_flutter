import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_page/home_page_widget.dart';
import 'welcome_page.dart';

class AuthController extends GetxController{
  //with instance AuthController would be able to the app everywhere
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
  
  _initialScreen(User? user){
    if(user == null) {
      print("login page");
      Get.offAll(()=>HomePageWidget());
    }else{
      print("successfully log in");
      Get.offAll(()=>WelcomePage(email:user.email!));
    }
  }

  void login(String email, password)async{
    try{
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e.toString());
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void logOut()async{
    await auth.signOut();
  }


}