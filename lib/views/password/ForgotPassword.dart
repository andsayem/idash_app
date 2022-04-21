// import 'package:flutter/gestures.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/api/api.dart';
import 'package:idash/views/password/ForgotOtp.dart';
import 'package:idash/views/password/reset_form.dart';
import 'package:idash/views/password/Otp.dart';
import 'package:idash/constants.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;

  TextEditingController emailController = TextEditingController(); 
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
                                      'assets/images/Forgot password-cuate.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                        child: Text('Forgot Password',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Please Enter Your Phone Number',
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
                                        controller: emailController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(11),
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: kPrimaryColor)),
                                            hintText: 'Entry Your Phone Number',
                                            // helperText:
                                            //     'Keep it short, this is just a demo.',
                                            labelText: 'Phone Number',
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
                                      _checkMail();
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

  void _checkMail() async {
    setState(() {
      //_isLoading = true;
    });
    var data = {'email': emailController.text};
    if (emailController.text == '') {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Please entry OTP Code",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else {
      var res = await CallApi().postLoginData(data, 'check-exists-user');
      var body = json.decode(res.body);
      if (body['status'] == 1) {
        // Fluttertoast.showToast(
        //     msg: body['message'],
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1);
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ForgotOtp(emailController.text)));
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
