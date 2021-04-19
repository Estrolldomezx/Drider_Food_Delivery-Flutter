import 'package:drider/screens/beforeHome1.dart';
import 'package:flutter/material.dart';


/*void main(){
  runApp(MyApp());
}*/
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Sarabun'),
      title: 'Drider Food&Delivery',
      home: OnboardingScreen(),
    );
  }
}
