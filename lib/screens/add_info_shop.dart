import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:drider/utility/my_style.dart';
import 'package:image_picker/image_picker.dart';

class AddInfoShop extends StatefulWidget {
  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  // void routeToAddInfo() {
  //   MaterialPageRoute materialPageRoute = MaterialPageRoute(
  //     builder: (context) => (),
  //   );
  //   Navigator.push(context, materialPageRoute);
  // }

  double lat, lng;

  File file;

  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    Position position = await findPosition();
    setState(() {
      lat = 6.9977845;
      lng = 100.4988803;
      // lat = position.latitude;
      // lng = position.longitude;
      print('lat = $lat, lng = $lng');
    });
  }

  Future<Position> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();

      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Information Shop')),
      ),
      body: SingleChildScrollView(
        // decoration: BoxDecoration(color: Colors.orange[50]),
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
            lat == null ? MyStyle().showProgess() : showMap(),
            //showMap(),
            MyStyle().mySizeboxORG(),
            saveButton(),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        color: MyStyle().primaryColor,
        //onPressed: () => routeToAddInfo(), //added
        onPressed: () {},
        icon: Icon(Icons.save_rounded),
        label: Text('Save Information'),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('myShop'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: 'ร้านของคุณ',
          snippet: 'ละติจูด = $lat ลองติจูด = $lng',
        ),
      ),
    ].toSet();
  }

  Container showMap() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
      height: 200.0,
      width: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
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
              child: file == null ? Image.asset('images/img.png') : Image.file(file),
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
              onPressed: () => chooseImage(ImageSource.gallery),
            ),
            IconButton(
                icon: Icon(
                  Icons.add_a_photo_rounded,
                  color: MyStyle().darkColor,
                  size: 36.0,
                ),
                onPressed: () => chooseImage(ImageSource.camera)),
          ],
        ),
      ],
    );
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    //resource image form camera or gallory
    try {
      var object = await ImagePicker().getImage(
        source: imageSource,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );
      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
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
