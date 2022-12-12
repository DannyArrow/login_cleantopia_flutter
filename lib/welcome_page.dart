
import 'package:flutter/material.dart';
import 'package:login/auth_controller.dart';

class WelcomePage extends StatelessWidget {

  String email;

  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gradient.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Text("Welcome " + email,
          style: TextStyle(fontSize: 25, color: Colors.white60, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic,
          shadows: [
              Shadow(color: Colors.black12, offset: Offset(2,1), blurRadius:10)
              ]  ),),
        ),
      ),

    );
  }


}