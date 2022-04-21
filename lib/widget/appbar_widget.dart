import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(color: Colors.red),
    backgroundColor: Colors.grey,
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.redAccent,
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
