import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     width: double.maxFinite,
     height: double.maxFinite,
     color: Colors.blueAccent,
     child: Center(
       child: Container(
         width: 100,
         height: 100,
         child: CircularProgressIndicator(
           backgroundColor: Colors.redAccent,
         ),
       ),
     ),
   );
  }


}
