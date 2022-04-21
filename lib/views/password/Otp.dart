import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/api/api.dart';
import 'package:idash/constants.dart';
import 'package:idash/views/login/loginScreen.dart';
import 'package:idash/views/password/Confirmation.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
class Otp extends StatefulWidget {
  final String email;
  const Otp(this.email);
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool _isLoading = false;

  TextEditingController codeController = TextEditingController(); 
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
                                      'assets/images/Enter OTP-bro.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                        child: Text('OTP Confirmation',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Please Enter Your OTP Number',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        // elevation: 4.0,
                        // color: Colors.white,
                        // margin: EdgeInsets.only(left: 20, right: 20),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15)),
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
                                        controller: codeController,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: <TextInputFormatter>[ 
                                          LengthLimitingTextInputFormatter(5),
                                          //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                        ],
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Entry Your OTP Code',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'OTP Code',
                                            prefixIcon: const Icon(
                                              Icons.mobile_friendly,
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
                                        _isLoading ? 'Loging...' : 'Submit',
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
                                      _otp(widget.email);
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

  void _otp(String email) async {
    setState(() {
      //_isLoading = true;
    });
    var data = {'email': email, 'otp_code': codeController.text};
    if (codeController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry OTP Code",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else {
      var res = await CallApi().postLoginData(data, 'varify_password_otp');
      var body = json.decode(res.body);
      if (body['status'] == 1) {
        Fluttertoast.showToast(
            msg: body['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => LogIn()));
      } else {
        Fluttertoast.showToast(
            msg: body['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    }

    // Navigator.push(
    //     context, new MaterialPageRoute(builder: (context) => Confirmation()));
  }
}
