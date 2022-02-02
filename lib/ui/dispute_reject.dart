import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

class DisputeRejectScreen extends StatefulWidget {
  String? title;

  DisputeRejectScreen({this.title});

  @override
  _DisputeRejectScreenState createState() => _DisputeRejectScreenState();
}

class _DisputeRejectScreenState extends State<DisputeRejectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:  HelperUtility.customAppBar(
              context: context, title: widget.title ?? ""),
          backgroundColor: Colorss.blackShadeColors.withOpacity(0.3),

          body: SingleChildScrollView(
        child: Column(
          children: [

            disputeDetailWidget()
          ],
        ),
      ),
    ));
  }

  disputeDetailWidget() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.margin_20),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.margin_15),
              topRight: Radius.circular(Dimens.margin_15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          firstSectionDetail(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          createrDetailWidget(
              headerTitle: Strings.disputeDetail,
              email: Strings.emailCreaterValue,
              name: Strings.nameCreaterValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          createrDetailWidget(
              headerTitle: Strings.disputeDetails,
              name: Strings.nameCreaterValue,
              email: Strings.emailValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          headerWithTilte(
              title: Strings.communicationType, value: Strings.chat),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          headerWithTilte(title: Strings.time, value: Strings.timeValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          headerWithTilte(
              title: Strings.appointmentDate,
              value: Strings.appointmentDateValue),
          HelperUtility.divider(),
          SizedBox(
            height: Dimens.margin_10,
          ),
          bottomSheetWidget()
        ],
      ),
    );
  }

  firstSectionDetail() {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimens.margin_20,
          left: Dimens.margin_10,
          right: Dimens.margin_10),
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

  bottomSheetWidget() {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.margin_20),
      child: Card(
        elevation: 0.8,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: HelperUtility.fullScreenHeight(context: context) * 0.45,
          padding: EdgeInsets.only(
              top: Dimens.margin_30,
              left: Dimens.margin_25,
              right: Dimens.margin_25),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimens.margin_15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: Dimens.margin_30),
                  height: Dimens.margin_2,
                  width: Dimens.margin_50,
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: HelperUtility.autoResizetextWidget(
                    text: Strings.reason, fontSize: Dimens.font_18),
              ),
              SizedBox(
                height: Dimens.margin_20,
              ),
              textFormFeild(),
              SizedBox(
                height: Dimens.margin_30,
              ),
              Container(
                child: HelperUtility.roundedButton(
                    paddingTB: Dimens.margin_10,
                    radius: Dimens.margin_10,
                    btnTxt: Strings.done,
                    fontSize: Dimens.font_20),
                width: Dimens.margin_100,
              )
            ],
          ),
        ),
      ),
    );
  }

  textFormFeild() {
    return Container(
      margin: EdgeInsets.only(left: Dimens.margin_5, right: Dimens.margin_5),
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_20)),
      ),
    );
  }
}
