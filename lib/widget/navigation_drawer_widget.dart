import 'package:idash/app_theme.dart';
import 'package:idash/views/ProfilePage/Changepassword.dart';
import 'package:idash/views/ProfilePage/profile_page.dart';
import 'package:idash/views/login/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:idash/constants.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    String name = 'AS Sayem';
    int user_id = 2345678;
    final urlImage =
        'https://scontent.fdac45-1.fna.fbcdn.net/v/t1.6435-9/174758568_1876822559146829_974792907856265948_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeFkfYth7hjnD2OXf7RjQcX5kuTxU0dt8MKS5PFTR23wwtdZe4bvrZUrU0oLjvklqTwMOEa4yAOPDmttjVLAO1v7&_nc_ohc=vhUYX17dckQAX8sNzkP&_nc_ht=scontent.fdac45-1.fna&oh=00_AT-BHAvn06d77Ny2uFTRZkkgyO17KKo74LdTJ6oTy6GKKg&oe=626EA9A2';

    return Drawer(
      child: Material(
        color:  CustomeTheme.secondaryLight,
        child: ListView(
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountName: Text(name),
            //   accountEmail: Text(user_id),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: NetworkImage(urlImage),
            //   ),
            // ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10 , bottom: 15),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 30, backgroundImage: NetworkImage(urlImage)),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'sayed@ssgbd.com',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              color: Colors.white,
              child: Column(
                children: [
                  // const SizedBox(height: 3),
                  // buildSearchField(),
                  const SizedBox(height: 4), 
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home ,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 4), 
                  buildMenuItem(
                    text: 'Sales',
                    icon: Icons.sailing ,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 4), 
                  buildMenuItem(
                    text: 'Production',
                    icon: Icons.factory ,
                    onClicked: () => selectedItem(context, 3),
                  ),
                   const SizedBox(height: 4), 
                  buildMenuItem(
                    text: 'Production',
                    icon: Icons.factory ,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 4), 
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 4),
                  buildMenuItem(
                    text: 'Change password',
                    icon: Icons.password_outlined,
                    onClicked: () => selectedItem(context, 4),
                  ),

                  const SizedBox(height:4),

                  // buildMenuItem(
                  //   text: 'Login',
                  //   icon: Icons.login,
                  //   onClicked: () => selectedItem(context, 5),
                  // ),
                  // Divider(
                  //   height: 1,
                  //   color: AppTheme.white.withOpacity(0.6),
                  // ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        trailing: Icon(
                          Icons.power_settings_new,
                          color: Colors.red,
                        ),
                        onTap: () {
                          logout(context);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: CustomeTheme.secondaryLight ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Changepassword(),
        ));
        break;
      case 5:
        //PointsHistory
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
        break;
    }
  }

  void logout(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setBool('isLoggedIn', false);
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new LogIn()),
        (route) => false);
  }
}
