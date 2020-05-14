import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Colors.red.shade500;
  Color primaryColor = Colors.blue.shade500;

  SizedBox mySizebox() => SizedBox(width: 8.0, height: 16.0,);

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.red.shade500,
          fontWeight: FontWeight.bold,
        ),
      );

  Container showLogo() {
    return Container(
      width: 180.0,
      child: Image.asset('images/logo1.png'),
    );
  }

  MyStyle();
}
