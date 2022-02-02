import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:HelperUtility.customAppBar(context: context,centerTitle: false,title: "UserName"),
          backgroundColor: Colorss.blackShadeColors.withOpacity(0.3),
          body: Container(
            height: HelperUtility.fullScreenHeight(context: context),
            width: HelperUtility.fullScreenWidth(context: context),

            child: Stack(
              children: [
                Positioned(child:  disputeDetailWidget(),
                 top: Dimens.margin_60,
                  bottom: 1,
                ),
                userImageWidget(),
              ],
            ),
          ),
        ));
  }

  userImageWidget() {
    return Container(
      height: Dimens.margin_250,
      margin: EdgeInsets.only(
          left: Dimens.margin_50,
          right: Dimens.margin_50,
          top: Dimens.margin_20),
      padding: EdgeInsets.only(
          left: Dimens.margin_60,
          right: Dimens.margin_60,
          top: Dimens.margin_30,
          bottom: Dimens.margin_30),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Dimens.margin_15)),
      child: Column(
        children: [
          HelperUtility.assetImage(
              path: Assets.dummyLogo,
              fit: BoxFit.cover,
              height: Dimens.width_100,
              width: Dimens.width_100),
          SizedBox(
            height: Dimens.margin_5,
          ),
          HelperUtility.textWidget(
              text: Strings.dummyUser, fontSize: Dimens.font_16),
          SizedBox(
            height: Dimens.margin_5,
          ),
          HelperUtility.textWidget(
              text: Strings.dummyUserEmail,
              fontSize: Dimens.font_16,
              color: Colors.white.withOpacity(0.5)),
          SizedBox(
            height: Dimens.margin_5,
          ),
          HelperUtility.textWidget(
              text: Strings.phnNumberTxt,
              fontSize: Dimens.font_16,
              color: Colors.white.withOpacity(0.5)),
          SizedBox(
            height: Dimens.margin_10,
          ),
        ],
      ),
    );
  }

  disputeDetailWidget() {
    return Container(
             width: HelperUtility.fullScreenWidth(context: context),
      margin: EdgeInsets.only(top: Dimens.margin_15),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.margin_15),
              topRight: Radius.circular(Dimens.margin_15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Dimens.margin_180,),
          activeButton(),
          SizedBox(height: Dimens.margin_10,),
          idUserNameWidget(titleFirst: Strings.id+" : ", valueFirst: Strings.idValue,titleSec: Strings.username+" : ",valueSec: Strings.guruNameValue),
         HelperUtility.divider(),
          SizedBox(height: Dimens.margin_10,),

          idUserNameWidget(titleFirst: Strings.countryTxt+" : ", valueFirst: Strings.countryValueTxt,titleSec: Strings.zipTxt+" : ",valueSec: Strings.zipValueTxt),
          HelperUtility.divider(),
          SizedBox(height: Dimens.margin_10,),

          idUserNameWidget(titleFirst: Strings.roleTxt+" : ", valueFirst: Strings.roleValueTxt,),
          HelperUtility.divider(),
          SizedBox(height: Dimens.margin_10,),

          idUserNameWidget(titleFirst: Strings.createdOn+" : ", valueFirst: Strings.appointmentDateValue,),
          HelperUtility.divider(),
          SizedBox(height: Dimens.margin_10,),

          idUserNameWidget(titleFirst: Strings.createdBy+" : ", valueFirst: Strings.admin,),
          HelperUtility.divider(),
          SizedBox(height: Dimens.margin_10,),
          inactiveBannedWidget(),
          SizedBox(height: Dimens.margin_10,),

        ],
      ),
    );
  }

  activeButton() {
    return Container(
      width: Dimens.margin_100,
      padding: EdgeInsets.all(Dimens.margin_8),
      margin: EdgeInsets.all(Dimens.margin_8),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(Dimens.margin_10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HelperUtility.roundImageWithAsset(
            path: Assets.activeImg,
            color: Colors.white,
            radius: Dimens.margin_25,
            width: Dimens.margin_20,
          ),
          SizedBox(width: Dimens.margin_5,),
          HelperUtility.textWidget(
              text: Strings.active, fontSize: Dimens.font_14)
        ],
      ),
    );
  }

  idUserNameWidget({titleFirst, valueFirst, titleSec, valueSec}) {
    return Padding(
      padding: EdgeInsets.only(left: Dimens.margin_10,right: Dimens.margin_10,bottom: Dimens.margin_10),
      child: Row(
        children: [
          HelperUtility.textWidget(
              text: titleFirst ?? Strings.nameCreater,
              fontSize: Dimens.font_14),
          Expanded(
              child: HelperUtility.textWidget(
                  text: valueFirst,
                  fontSize: Dimens.font_14,
                  color: Colors.white.withOpacity(0.5))),
          SizedBox(
            width: Dimens.margin_5,
          ),
          HelperUtility.textWidget(
              text: titleSec ??"",
              fontSize: Dimens.font_14),
          Expanded(
              child: HelperUtility.textWidget(
                  color: Colors.white.withOpacity(0.5),
                  text: valueSec,
                  fontSize: Dimens.font_14))
        ],
      ),
    );
  }
  inactiveBannedWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.margin_30,
        right: Dimens.margin_30,
        top: Dimens.margin_10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HelperUtility.roundedImageContainer(
                  imgPath: Assets.closeImg,
                  crossIconPadding: Dimens.margin_3,
                  title: Strings.inactiveTxt,
                  borderColor: Colors.white,
                  onTab: () {

                  }),
              SizedBox(width: Dimens.margin_30,),
              HelperUtility.roundedImageContainer(
                  imgPath: Assets.bannedImg,
                  crossIconPadding: 0.0,
                  title: Strings.bannedTxt,
                  borderColor: Colors.orange.withOpacity(0.6),
                  onTab: () {

                  }),
            ],
          ),
          SizedBox(height: Dimens.margin_20,),
         deleteBannedWidget()
        ],
      ),
    );
  }

  deleteBannedWidget() {
    return Row(
      children: [
        Spacer(),
        HelperUtility.simpleImageContainer(
            txtColor: Colors.red,
            imgPath: Assets.deleteImg,
            crossIconPadding: 0.0,
            title: Strings.delete,
            borderColor: Colors.red,
            onTab: () {

            }),
        Spacer(),
      ],
    );
  }
}
