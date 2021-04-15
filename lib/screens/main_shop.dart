import 'package:drider/utility/my_style.dart';
import 'package:drider/utility/signoutProcess.dart';
import 'package:drider/widget/information_shop.dart';
import 'package:drider/widget/list_food_menu_shop.dart';
import 'package:drider/widget/order_list_shop.dart';
import 'package:flutter/material.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Feild
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Main Shop')),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
      drawer: showDrawer(context),
      body: currentWidget,
    );
  }

  ListTile homeMenu(context) => ListTile(
      leading: Icon(Icons.menu_book),
      title: Text('รายการอาหารที่ลูกค้าสั่ง'),
      subtitle: Text('รายการที่ยังไม่ได้ทำ'),
      onTap: () {
        setState(() {
          currentWidget = OrderListShop();
        });
        Navigator.pop(context);
      });
  ListTile foodMenu(context) => ListTile(
      leading: Icon(Icons.fastfood_rounded),
      title: Text('เมนูอาหาร'),
      onTap: () {
        setState(() {
          currentWidget = ListFoodMenu();
        });
        Navigator.pop(context);
      });
  
  ListTile informationMenu(context) => ListTile(
      leading: Icon(Icons.info_outlined),
      title: Text('รายละเอียดของร้าน'),
      onTap: () {
        setState(() {
          currentWidget = InformationShop();
        });
        Navigator.pop(context);
      });
  ListTile signOutMenu(context) => ListTile(
        leading: Icon(Icons.logout),
        title: Text('Sign Out'),
        onTap: () => signOutProcess(context),
      );

  Drawer showDrawer(context) => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(context),
            foodMenu(context),
            informationMenu(context),
            signOutMenu(context),
          ],
        ),
      );
  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('header.png'),
      accountName: Text('Name Shop'),
      accountEmail: (Text('Login', style: TextStyle(color: Colors.white))),
    );
  }
}
