import 'package:flutter/material.dart';

class ScreenUtils{

  static pushRemoveUntilScreen({context,screen}){
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
          (route) => false,
    );
  }

  static pushScreen({context,screen}){
    return  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}