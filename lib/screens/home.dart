import 'package:drider/screens/signIn.dart';
import 'package:drider/screens/signup.dart';
import 'package:drider/utility/my_style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange[800],
      //   title: Text('Drider Food & Delivery'),
      // ),
      drawer: showDrawer(),
      body: Container(
        decoration: BoxDecoration(color: Colors.orange[50]),
        child: Center(
          child: Column(
            children: <Widget>[
              //MyStyle().showHeader(),
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  MyStyle().mySizebox(),
                  MyStyle().showLogo(),
                  MyStyle().showTitle3('Drider'),
                  //MyStyle().myColorSizebox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHeadDrawer(), signInMenu(), signUpMenu()],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'), accountEmail: Text('Please login'));
  }
}
