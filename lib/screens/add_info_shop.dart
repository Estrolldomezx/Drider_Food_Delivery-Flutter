import 'package:drider/utility/my_style.dart';
import 'package:flutter/material.dart';

class AddInfoShop extends StatefulWidget {
  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add Information Shop')),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.orange[50]),
          child: Column(
            children: <Widget>[
              MyStyle().mySizeboxORG(),
              nameForm(),
              MyStyle().mySizeboxORG(),
              addressForm(),
              MyStyle().mySizeboxORG(),
              phoneForm(),
              MyStyle().mySizeboxORG(),
              groupImage(),
              MyStyle().mySizeboxORG(),
              showMap(),
            ],
          ),
        ));
  }

  Container showMap() {
    return Container(
      height: 300.0,
    );
  }

  Row groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Text(
              'เพิ่มรูปภาพร้านค้า',
              style: TextStyle(fontSize: 18.0, color: MyStyle().primaryColor),
            ),
            MyStyle().mySizeboxORG(),
            Container(
              width: 200.0,
              child: Image.asset('images/img.png'),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
                icon: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: MyStyle().darkColor,
                  size: 40.0,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.add_a_photo_rounded,
                  color: MyStyle().darkColor,
                  size: 36.0,
                ),
                onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อร้านค้า',
                labelStyle: TextStyle(color: MyStyle().primaryColor),
                prefixIcon:
                    Icon(Icons.account_box_rounded, color: MyStyle().darkColor),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );
  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ที่อยู่ร้านค้า',
                labelStyle: TextStyle(color: MyStyle().primaryColor),
                prefixIcon:
                    Icon(Icons.location_on_rounded, color: MyStyle().darkColor),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );
  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'เบอร์โทรติดต่อ',
                labelStyle: TextStyle(color: MyStyle().primaryColor),
                prefixIcon: Icon(Icons.phone_enabled_rounded,
                    color: MyStyle().darkColor),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[200])),
              ),
            ),
          ),
        ],
      );
}
