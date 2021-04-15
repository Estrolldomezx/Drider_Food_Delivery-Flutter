import 'package:flutter/material.dart';
import 'package:drider/screens/signIn.dart';
import 'package:drider/screens/signup.dart';
import 'package:drider/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Drider Food & Delivery'),
      ),
      drawer: showDrawer(),
      body: Center(
        child: Container(
          // decoration: BoxDecoration(
          //   color: Colors.red.shade500,
          //   image: DecorationImage(
          //     image: AssetImage("images/bg_red.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    MyStyle().mySizebox(),
                    MyStyle().myColorSizebox(),
                    MyStyle().mySizebox(),
                    MyStyle().showTitle2('Drider Food & Delivery'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            SizedBox(
              height: 10.0,
            ),
            signUpMenu()
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.login_outlined),
      title: Text('Sign In'),
      tileColor: Colors.orange[100],
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
      leading: Icon(Icons.logout),
      title: Text('Sign Up'),
      tileColor: Colors.orange[100],
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
      // currentAccountPicture: MyStyle().showIcon(),
      decoration: MyStyle().myBoxDecoration('header.png'),
      accountName: Text('Guest'),
      accountEmail: Text('Please login'),
    );
    
  }
}
