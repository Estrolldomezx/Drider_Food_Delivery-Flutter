import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drider/models/user_model.dart';
import 'package:drider/screens/main_rider.dart';
import 'package:drider/screens/main_shop.dart';
import 'package:drider/screens/main_user.dart';
import 'package:drider/utility/my_style.dart';
import 'package:drider/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Field
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.orange[800],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.orange[50]),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showRiderLogo(),
                MyStyle().mySizeboxORG(),
                MyStyle().showTitle('Drider Food & Delivery'),
                MyStyle().mySizeboxORG(),
                userForm(),
                MyStyle().mySizeboxORG(),
                passwordForm(),
                MyStyle().mySizeboxORG(),
                loginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 180.0,
        child: RaisedButton(
          //color: MyStyle().darkColor,
          color: Colors.orange[800],
          onPressed: () {
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'Please try again');
            } else {
              checkAuthen();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkAuthen() async {
    String url =
        'http://172.26.0.1/drider/getUserWhereUser.php?isAdd=true&User=$user';

    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String chooseType = userModel.chooseType;
          if (chooseType == 'User') {
            routeToService(MainUser(), userModel);
          } else if (chooseType == 'Shop') {
            routeToService(MainShop(), userModel);
          } else if (chooseType == 'Rider') {
            routeToService(MainRider(), userModel);
          } else {
            normalDialog(context, 'Error, Please Try again');
          }
        } else {
          normalDialog(context, 'Wrong password !');
        }
      }
    } catch (e) {}
  }

  Future<Null> routeToService(Widget myWidget, UserModel userModel) async {
    //หากทำเสร็จ จะรีเทิร์นเป็น null
    //ส่งค่า userModel ไปยัง services หน้าต่างๆ
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id);
    preferences.setString('ChooseType', userModel.chooseType);
    preferences.setString('Name', userModel.name);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'USERNAME :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange[200])),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          obscureText: true,
          onChanged: (value) => password = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'PASSWORD :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
