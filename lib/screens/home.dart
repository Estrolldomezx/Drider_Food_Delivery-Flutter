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
        backgroundColor: Colors.orange[800],
        title: Text('Drider Food & Delivery'),
      ),
      drawer: showDrawer(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade500,
            image: DecorationImage(
              image: AssetImage("images/bg_red.jpg"),
              fit: BoxFit.cover,
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
      decoration: BoxDecoration(
        color: Colors.orange[600],
        image: DecorationImage(
              image: AssetImage("images/header.png"),
              fit: BoxFit.cover,
            ),
      ),
      accountName: Text('Guest'),
      accountEmail: Text('Please login'),
    );
  }
}
