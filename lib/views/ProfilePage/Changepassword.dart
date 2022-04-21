import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/api/api.dart';
import 'package:idash/constants.dart';
import 'package:idash/services/remote_services.dart';
import 'package:idash/views/login/loginScreen.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Changepassword extends StatefulWidget {
  @override
  //final String email;
  // Changepassword();
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool _isLoading = false;
  late String name;
  late String phone;
  late int id;
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_passwordController = TextEditingController();
 
  @override
  getApiData() async {
    var info = await RemoteServices.fetchPofile(); 
    setState(() {
      name = info!.name;
      phone = info.email;
      id = info.id;
      //Points = Get.put(PointsController());
    });
  }

  void initState() {
    super.initState();
    getApiData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: kPrimaryColor,
        title: Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  name.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        //centerTitle: true,
        //elevation: 20,
        shadowColor: kPrimaryLightColor,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Container(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fdac45-1.fna.fbcdn.net/v/t31.18172-8/27624828_959029654259462_713724137101352896_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeE4GeOXB8s3xjFRkl9smTbpZEDGDX7ZbZZkQMYNftltlt649Fv6t2Ihfda4WnBH7SrA7ZpXf_b20nBRyFvwHIfY&_nc_ohc=wqs-QTaLUocAX9DMKLu&_nc_ht=scontent.fdac45-1.fna&oh=00_AT-NHeC2BU2oDOmjKExQBjnS6U_DHINc84GKlnK05uDV5A&oe=6249B9D2'),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
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
                            const EdgeInsets.only(top: 10, left: 40, right: 40),
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
                        child: Text('Change Password',
                            style: TextStyle(
                                fontSize: 20,
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
                                        controller: oldpasswordController,
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Old Password',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'Old Password',
                                            prefixIcon: const Icon(
                                              Icons.lock,
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
                                      _resetPassword();
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

  void _resetPassword() async {
    var data = {
      'old_password': oldpasswordController.text,
      'password': passwordController.text,
      'confirm_password': confirm_passwordController.text
    };
    if (passwordController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry your old password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else if (passwordController.text == '') {
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
        var res = await CallApi().postWithTokenData(data, 'change-password');
        var body = json.decode(res.body);
        if (body['status'] == 1) {
          Fluttertoast.showToast(
              msg: body['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1);

          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setBool('isLoggedIn', false);
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new LogIn()),
              (route) => false);

          // Navigator.push(
          //     context, new MaterialPageRoute(builder: (context) => LogIn()));
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

      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) => LogIn()));
    }
  }
}
