import 'package:drider/utility/my_style.dart';
import 'package:drider/utility/signoutProcess.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Rider'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            // homeMenu(),
          ],
        ),
      );


  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('header.png'),
      accountName: Text('Name Rider'),
      accountEmail: (Text('Login', style: TextStyle(color: Colors.white))),
    );
  }
}
