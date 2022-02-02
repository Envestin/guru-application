import 'package:flutter/material.dart';
import 'package:guru/ui/settings_screen.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/custom_shape.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

import 'dashboard.dart';
import 'event_screen.dart';
import 'notifcation_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    DashBoardScreen(),
    EventScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.7,
          centerTitle: true,
          title: Text("${currentIndex==0?"Home":currentIndex==1?"Events":currentIndex==2?"Notifications":"Settings"}",style: TextStyle(fontSize: Dimens.font_16),),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: Dimens.margin_2,
          iconSize: Dimens.margin_15,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          //selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.green,
          onTap: (selectedIndex) {
            setState(() {
              currentIndex = selectedIndex;
            });
          },
          items: [
            bottomNavigationItems(imagePath: Assets.dashImg, index: 0),
            bottomNavigationItems(imagePath: Assets.eventImg, index: 1),
            bottomNavigationItems(imagePath: Assets.notificationImg, index: 2),
            bottomNavigationItems(imagePath: Assets.settingsImg, index: 3),
          ],
        ),
        body: Column(
          children: [

            Expanded(child: screens[currentIndex])
          ],
        ),
      ),
    );
  }

  bottomNavigationItems({imagePath, index}) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.black,
        icon: Padding(
          padding: EdgeInsets.only(top: Dimens.margin_10),
          child: HelperUtility.assetImage(
              path: imagePath,
              width: Dimens.margin_25,
              height: Dimens.margin_25,
              color: currentIndex == index ? Colors.white.withOpacity(0.7):Colorss.textFieldColor1 ,
              fit: BoxFit.contain),
        ),
        title: HelperUtility.textWidget(text: ""));
  }
}
