import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/ui/user_profile_screen.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

class UserScreen extends StatefulWidget {
  String? title;

  UserScreen({this.title});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isSeleced = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorss.textFieldColor1.withOpacity(0.3),
        body: Column(
          children: [
            HelperUtility.customAppBar(
                context: context, title: widget.title ?? ""),
            tabbedHeaderWidget(),
            SizedBox(
              height: Dimens.margin_5,
            ),
            Expanded(child: eventCardList())
          ],
        ),
      ),
    );
  }

  tabbedHeaderWidget() {
    return Container(
      margin: EdgeInsets.all(Dimens.margin_10),
      decoration: BoxDecoration(
          color: Colorss.textFieldColor1.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Dimens.margin_20)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              setState(() {
                isSeleced = !isSeleced;
              });
            },
            child: Container(
              padding: EdgeInsets.all(Dimens.margin_10),
              decoration: BoxDecoration(
                  color: isSeleced == true
                      ? Colors.orange
                      : Colorss.textFieldColor1.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.margin_20),
                      topRight: Radius.circular(
                          isSeleced == false ? 0.0 : Dimens.margin_20),
                      bottomLeft: Radius.circular(Dimens.margin_20),
                      bottomRight: Radius.circular(
                          isSeleced == false ? 0.0 : Dimens.margin_20))),
              child: Center(
                child: HelperUtility.autoResizetextWidget(
                    text: Strings.users, fontSize: Dimens.font_14),
              ),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: () {
              setState(() {
                isSeleced = !isSeleced;
              });
            },
            child: Container(
              padding: EdgeInsets.all(Dimens.margin_10),
              decoration: BoxDecoration(
                  color: isSeleced == false
                      ? Colors.orange
                      : Colorss.textFieldColor1.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          isSeleced == true ? 0.0 : Dimens.margin_20),
                      topRight: Radius.circular(Dimens.margin_20),
                      bottomLeft: Radius.circular(
                          isSeleced == true ? 0.0 : Dimens.margin_20),
                      bottomRight: Radius.circular(Dimens.margin_20))),
              child: Center(
                child: HelperUtility.autoResizetextWidget(
                    text: Strings.professionalUsers, fontSize: Dimens.font_14),
              ),
            ),
          )),
        ],
      ),
    );
  }

  eventCardList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(Dimens.margin_15),
            margin: EdgeInsets.only(
                left: Dimens.margin_10,
                right: Dimens.margin_10,
                bottom: Dimens.margin_10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Dimens.margin_14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventDateWidget(icon:Assets.timeImg ),
                SizedBox(
                  height: Dimens.margin_5,
                ),
                Row(
                  children: [
                    userImageWidget(),
                    SizedBox(
                      width: Dimens.margin_10,
                    ),
                    Expanded(child: detailAndSateWidget()),
                    SizedBox(
                      width: Dimens.margin_10,
                    ),
                    Expanded(child: eventOraganisedNameWidget()),
                  ],
                ),
                SizedBox(
                  height: Dimens.margin_5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: viewDetailDeteleWidget(),
                )
              ],
            ),
          );
        });
  }

  userImageWidget() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(Dimens.margin_1),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(Dimens.margin_25),
          ),
          child: HelperUtility.roundedImage(
              height: Dimens.margin_50, width: Dimens.margin_50),
        ),
        Positioned(
          bottom: -2,
          left: 13,
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(Dimens.margin_3),
            child: Center(
              child: HelperUtility.textWidget(
                  text: Strings.active, fontSize: Dimens.font_10),
            ),
          ),
        )
      ],
    );
  }

  eventDateWidget({icon,title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HelperUtility.assetImage(path: icon,color: Colors.white,height: Dimens.margin_18,width: Dimens.margin_18),
        SizedBox(
          width: Dimens.margin_5,
        ),
        HelperUtility.autoResizetextWidget(
            text: title??Strings.createdOnValue, fontSize: Dimens.font_12)
      ],
    );
  }

  detailAndSateWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HelperUtility.textWidget(
            text: Strings.dummyUser, fontSize: Dimens.font_13),
        SizedBox(
          height: Dimens.margin_5,
        ),
        HelperUtility.autoResizetextWidget(
            text: Strings.dummyUserEmail, fontSize: Dimens.font_14),
      ],
    );
  }

  eventOraganisedNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HelperUtility.autoResizetextWidget(
            text: Strings.userName, fontSize: Dimens.font_13),
        SizedBox(
          height: Dimens.margin_5,
        ),
        Row(
          children: [
            Icon(
              Icons.two_k_plus_rounded,
              size: Dimens.margin_15,
            ),
            SizedBox(
              width: Dimens.margin_5,
            ),
            Expanded(
                child: HelperUtility.textWidget(
                    color: Colors.white.withOpacity(0.5),
                    text: Strings.guruNameValue,
                    fontSize: Dimens.font_13))
          ],
        )
      ],
    );
  }

  priceAndValueWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HelperUtility.textWidget(
            text: Strings.priceTitle, fontSize: Dimens.font_14),
        SizedBox(
          height: Dimens.margin_5,
        ),
        HelperUtility.autoResizetextWidget(
            color: Colors.white.withOpacity(0.5),
            text: Strings.price,
            fontSize: Dimens.font_13)
      ],
    );
  }

  viewDetailDeteleWidget(){
    return InkWell(
     onTap: (){
       ScreenUtils.pushScreen(context: context,screen: UserProfileScreen());
     },

      child: Container(
        padding: EdgeInsets.only(left: Dimens.margin_15,right: Dimens.margin_15,top: Dimens.margin_5,bottom: Dimens.margin_5),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.7),
          borderRadius: BorderRadius.circular(Dimens.margin_10)
        ),
        child:   HelperUtility.autoResizetextWidget(
            text: Strings.viewDetails, fontSize: Dimens.font_12),
      ),
    );
  }
}
