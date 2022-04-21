import 'package:flutter/material.dart';
import 'package:idash/views/login/loginScreen.dart';
import 'package:idash/views/tabs/tabs.dart';
import 'package:idash/widget/navigation_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey globalKey = GlobalKey();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static of(BuildContext context) {}
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
 
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
   
   
      home: Scaffold(
        drawer: NavigationDrawerWidget(),
        //body : Technician(),
        // body : ProfilePage(),
        // body:  LogIn(),
         body: _isLoggedIn ? Tabs() : LogIn(),
        //  body: Tabs() ,
        // body: QRcodeResponse() ,
      ),
    );
  }
}
