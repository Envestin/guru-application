
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guru/ui/login_screen.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? timer;

  @override
  void initState() {
    startTimer();

    // TODO: implement initState
    super.initState();
  }

  startTimer(){
    timer=Timer.periodic(Duration(seconds: 3), (timer) {
      moveToScreen();
    });
  }


  moveToScreen(){
    ScreenUtils.pushRemoveUntilScreen(context: context,screen: LoginScreen() );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child:Padding(
              padding: EdgeInsets.all(Dimens.margin_20),
                child:  HelperUtility.assetImage(path:Assets.splashLogo),
            )),
      ),
    );
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
   }
}
