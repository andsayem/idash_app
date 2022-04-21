import 'package:idash/constants.dart';
import 'package:flutter/material.dart';
import 'package:idash/views/Home/Home.dart'; 
import 'package:idash/views/ProfilePage/profile_page.dart';    
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:idash/views/login/loginScreen.dart'; 
class Tabs extends StatefulWidget {
  @override
  static final String title = 'QR Code';

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
    int _page = 0;
  final pages = [Home(), LogIn(), Home()];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // appBar: AppBar(
      //     title: Text(title),
      //     backgroundColor: kPrimaryColor,
      //   ),

      body: Scaffold(
        backgroundColor: kPrimaryLightColor,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 70.0,
          items: <Widget>[
            Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.qr_code,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.supervised_user_circle ,
              size: 30,
              color: Colors.white,
            ),
            // Icon(Icons.call_split, size: 30, color: Colors.white,),
            // Icon(Icons.perm_identity, size: 30, color: Colors.white,),
          ],
          color: kPrimaryColor,
          buttonBackgroundColor: kPrimaryLightColor,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: pages[_page])
 
    );
  }
}
