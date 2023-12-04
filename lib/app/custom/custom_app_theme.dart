import 'package:flutter/material.dart';


abstract class CustomColors {
  
  static Color customBaseColor = const Color.fromRGBO(33, 82, 102, 1);
  static Color customButtonColor = const Color.fromARGB(255, 55, 148, 87);
 
}

class CustomAppTheme {

  static BoxDecoration get gradientBackground {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(33, 82, 102, 1),
          Color.fromRGBO(44, 139, 135, 0.9),
        ],
      ),
    );
  }
}











