import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

import 'change_password.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Padding(
        padding: EdgeInsets.only(left: Dimens.margin_20,right: Dimens.margin_20,top: Dimens.margin_20),
        child: Column(
          children: [
            SizedBox(
              height: Dimens.margin_15,
            ),
            rowItemWidget(title: Strings.notificationsTxt, path: Assets.notificationImg),
            SizedBox(
              height: Dimens.margin_15,
            ),
           InkWell(child:  rowItemWidget(title: Strings.chnagePasswordTxt, path: Assets.changePasswordImg),
               onTap: (){
             ScreenUtils.pushScreen(context: context,screen: ChangePasswordScreen());
               },),
            SizedBox(
              height: Dimens.margin_15,
            ),
            rowItemWidget(title: Strings.logoutTxt, path: Assets.logoutImg),
          ],
        ),
      ),
    ));
  }

  rowItemWidget({isShowDivider, title, path}) {
    return Column(
      children: [
        Row(
          children: [
            HelperUtility.assetImage(
                path: path,
                color: Colors.white,
                height: Dimens.margin_25,
                fit: BoxFit.contain,
                width: Dimens.margin_25),
            SizedBox(
              width: Dimens.margin_10,
            ),
            HelperUtility.textWidget(text: title, fontSize: Dimens.font_16)
          ],
        ),
        SizedBox(
          height: Dimens.margin_15,
        ),
        Divider(
          height: Dimens.margin_1,
          color: Colors.white,
          thickness: 0.2,
        )
      ],
    );
  }
}
