import 'package:flutter/material.dart';
import 'package:idash/constants.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: TextFormField(
          decoration: InputDecoration(
              hintText: 'Confirmation',
              hintStyle: TextStyle(color: kPrimaryColor),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)))),
    );
  }
}
