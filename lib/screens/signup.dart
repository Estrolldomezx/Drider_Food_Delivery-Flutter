import 'package:drider/utility/my_style.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType;

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
        child: ListView(padding: EdgeInsets.only(top: 20.0), children: <Widget>[
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
      padding: EdgeInsets.only(left: 50.0,right: 50.0),
        child: RaisedButton(
          color: Colors.orange[800],
          onPressed: () {},
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );


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
                  style: TextStyle(color: MyStyle().darkColor),
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
                  style: TextStyle(color: MyStyle().darkColor),
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
                  style: TextStyle(color: MyStyle().darkColor),
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.face, color: Colors.orange[700]),
                labelStyle: TextStyle(color: Colors.orange[700]),
                labelText: 'NAME :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[700])),
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box, color: Colors.orange[700]),
                labelStyle: TextStyle(color: Colors.orange[700]),
                labelText: 'USERNAME :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[700])),
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.orange[700]),
                labelStyle: TextStyle(color: Colors.orange[700]),
                labelText: 'PASSWORD :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[700])),
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
