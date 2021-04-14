import 'package:drider/screens/home.dart';
import 'package:drider/screens/main_rider.dart';
import 'package:drider/screens/main_shop.dart';
import 'package:drider/screens/main_user.dart';
import 'package:drider/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drider/utility/normal_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    checkPreference();
  }

  Future<Null> checkPreference() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == 'Shop') {
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'Error User Type');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange[700] : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.7],
              colors: [
                Colors.orange[50],
                Colors.orange[100],
                // Colors.orange[200],
                // Colors.orange[300],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 360.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/burger2.png',
                                ),
                                width: 250.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Center(
                              child: Text(
                                'Food You Love',
                                style: kTitleStyle,
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/new_logo1.png',
                                ),
                                // height: 290.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: Text(
                                'Delivered To You',
                                style: kTitleStyle,
                              ),
                            ),
                            // SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/new_party1.png',
                                ),
                                //height: 280.0,
                                width: 400.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child: Text(
                                'So You Can Enjoy',
                                style: kTitleStyle,
                              ),
                            ),
                            // SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 50),
                                curve: Curves.ease,
                              );
                            },
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // TextButton(
                                  //   'Next',
                                  //   style: TextStyle(
                                  //     color: Colors.orange[500],
                                  //     fontSize: 22.0,
                                  //   ),
                                  // ),
                                  //

                                  Container(
                                    width: 300.0,
                                    child: TextButton(
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.orange[700]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                    side: BorderSide(color: Colors.orange[700])))),
                                        onPressed: () => null),
                                  ),
                                  SizedBox(width: 10.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 70.0, //100
              width: double.infinity,
              color: Colors.orange[700],
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Home());
                  Navigator.push(context, route);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
