import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.orange[800];
  Color primaryColor = Colors.orange[700];
  Color secondColor = Colors.red[400];
  Color DrawerColor = Colors.red[600];

  Widget showProgess(){
    return Center(child: CircularProgressIndicator(),);
  }

  var color;

  SizedBox mySizeboxORG() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 56.0,
      );

  SizedBox mySizebox2() => SizedBox(
        height: 36.0,
      );

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.orange[300],
            fontFamily: 'Sarabun-Bold',
          ),
        ),
      ),
    );
  }

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
          fontSize: 24.0,
          color: Colors.orange[50],
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

  Container showIcon() {
    return Container(
      width: 60.0,
      // height: 150.0,
      child: Image.asset('images/new_logo1.png'),
    );
  }

  Container showLogo() {
    return Container(
      width: 260.0,
      // height: 150.0,
      child: Image.asset('images/food_logo.png'),
    );
  }

  Container showRiderLogo() {
    return Container(
      width: 200.0,
      // height: 150.0,
      child: Image.asset('images/logo1_fire.png'),
    );
  }

  Container showBackground() {
    return Container(
      // width: 160.0,
      child: Image.asset('images/bg_red.jpg'),
    );
  }

  Container showHeader() {
    return Container(
      width: 380.0,
      child: Image.asset('images/header.png'),
    );
  }

  SizedBox myColorSizebox() => SizedBox(
        width: 260.0,
        // height: 260.0,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
              ],
            ),
          ),
        ),
      );

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      color: Colors.orange[600],
      image: DecorationImage(
        image: AssetImage("images/$namePic"),
        fit: BoxFit.cover,
      ),
    );
  }

  MyStyle();
}

class MyIcon {
  Container showBurger() {
    return Container(
      width: 200.0,
      // height: 150.0,
      child: Image.asset('images/burger.png'),
    );
  }

  MyIcon();
}

final kTitleStyle = TextStyle(
  color: Colors.grey[800],
  // fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
  fontWeight: FontWeight.bold,
);

final kSubtitleStyle = TextStyle(
  color: Colors.grey[600],
  fontSize: 18.0,
  height: 1.2,
);
