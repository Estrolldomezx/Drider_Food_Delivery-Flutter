import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.orange[800];
  Color primaryColor = Colors.orange[700];
  Color secondColor = Colors.red[400];

  var color;

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 56.0,
      );

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

  Text showTitle3(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 38.0,
          color: Colors.red.shade500,
          fontWeight: FontWeight.w600,
        ),
      );

  Container showLogo() {
    return Container(
      width: 180.0,
      child: Image.asset('images/logo1_fire.png'),
    );
  }

  Container showHeader() {
    return Container(
      width: 380.0,
      child: Image.asset('images/header.png'),
    );
  }

  SizedBox myColorSizebox() => SizedBox(
        width: 380.0,
        height: 258.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[500],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              mySizebox(),
              showLogo(),
            ],
          ),
        ),
      );

  MyStyle();
}
