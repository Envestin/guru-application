import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Column(
        children: [
          Expanded(child: notifcationListWidget()),
        ],
      ),
    ));
  }

  notifcationListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(Dimens.margin_15),
            margin: EdgeInsets.only(
                left: Dimens.margin_20,
                right: Dimens.margin_20,
                top: Dimens.margin_10,
                bottom: Dimens.margin_5),
            decoration: BoxDecoration(
              color: Colorss.blackShadeColors.withOpacity(0.3),
              borderRadius: BorderRadius.circular(Dimens.margin_14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    notifcationImgWidget(),
                    SizedBox(
                      width: Dimens.margin_10,
                    ),
                    Expanded(
                        child: HelperUtility.textWidget(
                            color: Colors.white.withOpacity(0.7),
                            maxLines: 2,
                            text: Strings.dummyNotiTxt,
                            fontSize: Dimens.font_14))
                  ],
                ),
               Padding(padding: EdgeInsets.only(right: Dimens.margin_10),
               child:  HelperUtility.textWidget(
                   color: Colors.white.withOpacity(0.7),
                   maxLines: 2,
                   text: Strings.notifcationTime,
                   fontSize: Dimens.font_14),

               )
              ],
            ),
          );
        });
  }

  notifcationImgWidget() {
    return Container(
      padding: EdgeInsets.all(Dimens.margin_15),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Dimens.margin_30)),
      child: HelperUtility.assetImage(
          path: Assets.notificationImg,
          color: Colors.white,
          height: Dimens.margin_20,
          fit: BoxFit.contain,
          width: Dimens.margin_20),
    );
  }
}
