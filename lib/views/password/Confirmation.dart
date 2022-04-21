import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/api/api.dart';
import 'package:idash/constants.dart';
import 'package:idash/views/login/loginScreen.dart';
import 'dart:convert';

class Confirmation extends StatefulWidget {
  @override
  final String email;
  Confirmation(this.email);
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_passwordController = TextEditingController(); 
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
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Container(
                          height: 250, // mq.size.height ,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Reset password-pana.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                        child: Text('Reset Your Password',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 5,
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
                                  primaryColor: Colors.redAccent,
                                  primaryColorDark: Colors.red,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: TextField(
                                        controller: passwordController,
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Password',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'Password',
                                            prefixIcon: const Icon(
                                              Icons.password_rounded,
                                              color: kPrimaryColor,
                                            ),
                                            prefixText: ' ',
                                            // suffixText: 'USD',
                                            suffixStyle: const TextStyle(
                                                color: kPrimaryColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: TextField(
                                        controller: confirm_passwordController,
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Confirm password',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'Confirm password',
                                            prefixIcon: const Icon(
                                              Icons.password_rounded,
                                              color: kPrimaryColor,
                                            ),
                                            prefixText: ' ',
                                            // suffixText: 'USD',
                                            suffixStyle: const TextStyle(
                                                color: kPrimaryColor)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
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
                                        _isLoading ? 'Loding...' : 'Submit',
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
                                    onPressed: () {
                                      _resetPassword(widget.email);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ////////////   new account///////////////
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

  void _resetPassword(String email) async {
    var data = {
      'email': email,
      'password': passwordController.text,
      'confirm_password': confirm_passwordController.text
    };
    if (passwordController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry your password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else if (confirm_passwordController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry your confirm password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else {
      if (confirm_passwordController.text == passwordController.text) {
        var res = await CallApi().postLoginData(data, 'reset-password');
        var body = json.decode(res.body);
        if (body['status'] == 1) {
          Fluttertoast.showToast(
              msg: body['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => LogIn()));
        } else {
          Fluttertoast.showToast(
              msg: body['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Your password doesn't match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      } 
    }
  }
}
