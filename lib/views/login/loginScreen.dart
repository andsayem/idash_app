import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:dashboard/Home/homeScreen.dart';
//import 'package:dashboard/SignUp/signUpScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/api/api.dart';
import 'package:idash/constants.dart';
import 'package:idash/views/Home/Home.dart';
import 'package:idash/views/password/ForgotPassword.dart';
import 'package:idash/views/tabs/tabs.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:flutter/services.dart'; 

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isLoading = false;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            //  Text('data'),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Container(
                          height: 250, // mq.size.height ,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/login.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: new Theme(
                                data: new ThemeData(
                                  primaryColor: kPrimaryColor,
                                  primaryColorDark: kPrimaryColor,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: TextField(
                                        controller: mailController,
                                        keyboardType: TextInputType.emailAddress,
                                          // Only n
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText:
                                                'Entry Your Username',
                                            labelText: 'Email Address',
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: kPrimaryColor,
                                            ),
                                            
                                            // suffixText: 'USD',
                                            suffixStyle: const TextStyle(
                                                color: kPrimaryColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: TextField(
                                        controller: passwordController, 
                                        obscureText: !_showPassword,
                                        textInputAction: TextInputAction.go,
                                         onSubmitted: (value) {
                                         _login();
                                        },
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Entry Your Password',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'Password',
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                              color: kPrimaryColor,
                                            ),
                                            prefixText: '',
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                _togglevisibility();
                                              },
                                              child: Icon(
                                                _showPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            // suffixText: 'USD',
                                            suffixStyle: const TextStyle(
                                                color: kPrimaryColor)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ));
                                },
                                child: Container(
                                  height: 20,
                                  // width: 60000,
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(20),
                                      // gradient: LinearGradient(colors: [
                                      //   kPrimaryLightColor,
                                      //   kPrimaryColor,
                                      // ])
                                      ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Forgot Password? ",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                        _isLoading ? 'Loging...' : 'Login',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    color: kPrimaryColor,
                                    disabledColor: Colors.grey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(3)),
                                    onPressed: _isLoading ? null : _login,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),  
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    // Navigator.push(
    //       context, new MaterialPageRoute(builder: (context) => Tabs()));

    if (mailController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry your username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1);
    } else if (passwordController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry your password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1);
    } else {
      _isLoading = false;
      //final LoginController loginController = Get.put(LoginController('pass'));

      // var data = {
      //   'email': mailController.text,
      //   'password': passwordController.text
      // };
      var data = {
        'email': mailController.text,
        'password': passwordController.text
      };

      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) => Tabs()));
      var res = await CallApi().postLoginData(data, 'login');
      var body = json.decode(res.body);
      if (body['status'] == 1) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var user = body['user'];
        var token = body['token'];
        localStorage.setString('user', json.encode(user));
        localStorage.setString('token', token);
        localStorage.setBool('isLoggedIn', true);
        Fluttertoast.showToast(
            msg:  body['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Tabs()));
      } else {
        Fluttertoast.showToast(
            msg:  body['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    }
  }
}
