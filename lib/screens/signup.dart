import 'package:dio/dio.dart';
import 'package:drider/utility/my_style.dart';
import 'package:drider/utility/normal_dialog.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange[50],
        ),
        child: ListView(
            padding: EdgeInsets.only(top: 20.0),
            children: <Widget>[
              myLogo(),
              MyStyle().mySizebox(),
              showAppName(),
              MyStyle().mySizebox(),
              nameForm(),
              MyStyle().mySizebox(),
              userForm(),
              MyStyle().mySizebox(),
              passwordForm(),
              MyStyle().mySizebox(),
              userRadio(),
              shopRadio(),
              riderRadio(),
              registerButton(),
            ]),
      ),
    );
  }

  Widget registerButton() => Container(
        padding:
            EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0, bottom: 10.0),
        child: RaisedButton(
          color: Colors.orange[500],
          onPressed: () {
            print(
                'name = $name, user = $user, password = $password, chooseType = $chooseType');
            if (name == null ||
                name.isEmpty ||
                user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('Have a space');
              normalDoalog(context, 'กรุณากรอกข้อมูลให้ครบถ้วน');
            } else if (chooseType == null) {
              normalDoalog(context, 'โปรดเลือกประเภทให้ถูกต้อง');
            } else {
              checkUser();
            }
          },
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      );

      Future<Null> checkUser() async {
        String url = 'http://172.26.0.1/drider/getUserWhereUser.php?isAdd=true&User=$user';

        await Dio().get(url).then((res) {
          if (res.toString() == 'null') {
            registerThread();
          } else {
            normalDoalog(context, '$user is already registered');
          }
        });
      }

      Future<Null> registerThread() async {
        String url = 'http://172.26.0.1/drider/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';
        
        await Dio().get(url).then((res) {
          print('res = $res');

          if (res.toString() == 'true') { //echo true from php
            Navigator.pop(context);
          } else{
            normalDoalog(context, 'Can not Sign up, Please try again');
          }

        });
      
      }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ผู้สั่งอาหาร',
                  style: TextStyle(
                      color: MyStyle().secondColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Shop',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'เจ้าของร้านอาหาร',
                  style: TextStyle(
                      color: MyStyle().secondColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Rider',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ผู้ส่งอาหาร',
                  style: TextStyle(
                      color: MyStyle().secondColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.face, color: MyStyle().primaryColor),
                labelStyle: TextStyle(color: MyStyle().primaryColor),
                labelText: 'NAME :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.account_box, color: MyStyle().primaryColor),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'USERNAME :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              obscureText: true,
              onChanged: (value) => password = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: MyStyle().primaryColor),
                labelStyle: TextStyle(color: MyStyle().primaryColor),
                labelText: 'PASSWORD :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTitle('Drider Food & Delivery'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );
}
