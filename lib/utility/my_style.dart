import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Colors.orange[800];
  Color primaryColor = Colors.orange[700];
  Color secondColor = Colors.red[400];

  SizedBox mySizebox() => SizedBox(width: 8.0, height: 16.0,);

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.red.shade500,
          fontWeight: FontWeight.bold,
        ),
      );

  Text showTitle2(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
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
