import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

import 'chat_screen.dart';
import 'dispute_accept.dart';
import 'dispute_reject.dart';

class DisputeScreen extends StatefulWidget {
  String? title;

  DisputeScreen({this.title});

  @override
  _DisputeScreenState createState() => _DisputeScreenState();
}

class _DisputeScreenState extends State<DisputeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: HelperUtility.customAppBar(context: context, title: widget.title),
      body: Column(
        children: [Expanded(child: disputeDetailWidget())],
      ),
    ));
  }

  disputeDetailWidget() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.margin_15),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.margin_15),
              topRight: Radius.circular(Dimens.margin_15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          firstSectionDetail(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          createrDetailWidget(
              headerTitle: Strings.disputeDetail,
              email: Strings.emailCreaterValue,
              name: Strings.nameCreaterValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          createrDetailWidget(
              headerTitle: Strings.disputeDetails,
              name: Strings.nameCreaterValue,
              email: Strings.emailValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          headerWithTilte(
              title: Strings.communicationType, value: Strings.chat),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          headerWithTilte(title: Strings.time, value: Strings.timeValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          headerWithTilte(
              title: Strings.appointmentDate,
              value: Strings.appointmentDateValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          headerWithTilte(
              title: Strings.createdOn, value: Strings.createdOnValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          createrDetailWidget(
              headerTitle: null,
              title1: Strings.payment,
              title2: Strings.refundAmount,
              name: Strings.paymentValue,
              email: Strings.refundAmountValue),
          SizedBox(
            height: Dimens.margin_5,
          ),
          disputeDescrptionWidget(),
          SizedBox(
            height: Dimens.margin_5,
          ),
          chatAdminUserWidget(),
          acceptRejectWidget(),
        ],
      ),
    );
  }

  firstSectionDetail() {
    return Padding(
      padding: EdgeInsets.all(Dimens.margin_8),
      child: Row(
        children: [
          HelperUtility.textWidget(
              text: Strings.disputeNumber, fontSize: Dimens.font_16),
          Spacer(),
          HelperUtility.roundedButton(
              paddingTB: Dimens.margin_4,
              radius: Dimens.margin_20,
              btnTxt: Strings.pending,
              fontSize: Dimens.font_14)
        ],
      ),
    );
  }

  createrDetailWidget({headerTitle, name, email, title1, title2}) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_8,
          right: Dimens.margin_8,
          bottom: Dimens.margin_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headerTitle != null
              ? HelperUtility.textWidget(
                  text: headerTitle, fontSize: Dimens.font_14)
              : SizedBox(
                  height: Dimens.margin_0,
                  width: Dimens.margin_0,
                ),
          headerTitle != null
              ? SizedBox(
                  height: Dimens.margin_5,
                )
              : SizedBox(
                  height: Dimens.margin_0,
                  width: Dimens.margin_0,
                ),
          Padding(
            padding: EdgeInsets.only(
                left: headerTitle != null ? Dimens.margin_10 : Dimens.margin_8,
                top: Dimens.margin_5),
            child: Row(
              children: [
                HelperUtility.textWidget(
                    text: title1 ?? Strings.nameCreater,
                    fontSize: Dimens.font_14),
                Flexible(
                    child: HelperUtility.textWidget(
                        text: name,
                        fontSize: Dimens.font_14,
                        color: Colors.white.withOpacity(0.5))),
                SizedBox(
                  width: Dimens.margin_5,
                ),
                HelperUtility.textWidget(
                    text: title1 ?? Strings.emailCreater,
                    fontSize: Dimens.font_14),
                Flexible(
                    child: HelperUtility.textWidget(
                        color: Colors.white.withOpacity(0.5),
                        text: email,
                        fontSize: Dimens.font_14))
              ],
            ),
          )
        ],
      ),
    );
  }

  headerWithTilte({title, value}) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_8,
          right: Dimens.margin_8,
          bottom: Dimens.margin_8),
      child: Row(children: [
        HelperUtility.textWidget(text: title + " : ", fontSize: Dimens.font_14),
        Flexible(
            child: HelperUtility.textWidget(
                text: value,
                fontSize: Dimens.font_14,
                color: Colors.white.withOpacity(0.5)))
      ]),
    );
  }

  disputeDescrptionWidget() {
    return Padding(
      padding: EdgeInsets.all(Dimens.margin_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.disputeDescription + " : ",
              fontSize: Dimens.font_14),
          SizedBox(
            height: Dimens.margin_5,
          ),
          HelperUtility.textWidget(
              text: Strings.disputeDescriptionValue,
              fontSize: Dimens.font_14,
              maxLines: 4,
              color: Colors.white.withOpacity(0.5))
        ],
      ),
    );
  }

  chatAdminUserWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_12,
          right: Dimens.margin_12,
          top: Dimens.margin_30),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                onTap: (){
                  ScreenUtils.pushScreen(context: context,screen: ChatScreen());

                },child: HelperUtility.roundedButton(
                  fontSize: Dimens.font_13,
                  paddingTB: Dimens.margin_7,
                  radius: Dimens.margin_15,
                  btnTxt: Strings.chatWithUser,
                  imgPath: Assets.chatImg),
              )),
          SizedBox(
            width: Dimens.margin_10,
          ),
         Expanded(
             child: InkWell(
               onTap: (){
                 ScreenUtils.pushScreen(context: context,screen: ChatScreen());

               },
               child: HelperUtility.roundedButton(
                   fontSize: Dimens.font_13,
                   paddingTB: Dimens.margin_7,
                   radius: Dimens.margin_15,
                   btnTxt: Strings.chatWithGuru,
                   imgPath: Assets.chatImg),
             ))
        ],
      ),
    );
  }

  acceptRejectWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.margin_30,
        right: Dimens.margin_30,
        top: Dimens.margin_30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HelperUtility.roundedImageContainer(
              imgPath: Assets.tickImg,
              crossIconPadding: Dimens.margin_3,
              title: Strings.approveTxt,
              borderColor: Colors.green,
              onTab: () {
                ScreenUtils.pushScreen(
                    context: context,
                    screen: DisputeAcceptScreen(
                      title: widget?.title,
                    ));
              }),
          HelperUtility.roundedImageContainer(
              imgPath: Assets.closeImg,
              crossIconPadding: Dimens.margin_5,
              title: Strings.rejectTxt,
              borderColor: Colors.orange.withOpacity(0.6),
              onTab: () {
                ScreenUtils.pushScreen(
                    context: context,
                    screen: DisputeRejectScreen(
                      title: widget?.title,
                    ));
              }),
        ],
      ),
    );
  }
}
