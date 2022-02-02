import 'package:flutter/material.dart';
import 'package:guru/ui/user_profile_screen.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

class KeywordRequestScreen extends StatefulWidget {
  String? title;

  KeywordRequestScreen({this.title});

  @override
  _KeywordRequestScreenState createState() => _KeywordRequestScreenState();
}

class _KeywordRequestScreenState extends State<KeywordRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colorss.textFieldColor1.withOpacity(0.3),
      appBar: HelperUtility.customAppBar(context: context, title: widget.title),
      body: Column(
        children: [Expanded(child: keywordRequestListWidget())],
      ),
    ));
  }

  keywordRequestListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(Dimens.margin_15),
            margin: EdgeInsets.only(
                top: Dimens.margin_5,
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
                newRequestWidget()

               ,
                SizedBox(
                  height: Dimens.margin_10,
                ),
                provideDetailsWidget(),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                HelperUtility.divider(height: 0.5),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                categoryWidget(),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                keywordRequestedWidget()
              ],
            ),
          );
        });
  }

  newRequestWidget(){
    return Row(
      children: [
         Spacer(),

        Container(
          margin: EdgeInsets.only(right: Dimens.margin_2),
          padding: EdgeInsets.all(Dimens.margin_5),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(Dimens.margin_4)
        ),),

       // newRequested
        questionTitleWidget(
            title: Strings.newRequested, fontSize: Dimens.font_14),
      ],
    );
  }

  provideDetailsWidget() {
    return Row(
      children: [
        provideImageWidget(),
        SizedBox(
          width: Dimens.margin_10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            questionTitleWidget(
                title: Strings.dummyUser, fontSize: Dimens.font_14),
            SizedBox(
              height: Dimens.margin_5,
            ),
            HelperUtility.textWidget(
                text: Strings.dummyUserEmail,
                fontSize: Dimens.font_16,
                color: Colors.white.withOpacity(0.5))
          ],
        ),
        Spacer(),
        detailAndDeleteWidget(),
      ],
    );
  }

  questionTitleWidget({title, fontSize, color}) {
    return HelperUtility.textWidget(
        text: title, fontSize: fontSize, color: color ?? Colors.white);
  }

  provideImageWidget() {
    return Container(
      padding: EdgeInsets.all(Dimens.margin_1),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(Dimens.margin_25),
      ),
      child: HelperUtility.roundedImage(
          height: Dimens.margin_50, width: Dimens.margin_50),
    );
  }

  detailAndDeleteWidget() {
    return InkWell(
      onTap: () {
        ScreenUtils.pushScreen(context: context, screen: UserProfileScreen());
      },
      child: HelperUtility.roundedButton(
          paddingTB: Dimens.margin_4,
          radius: Dimens.margin_5,
          btnTxt: Strings.viewDetails,
          fontSize: Dimens.font_14),
    );
  }

  categoryWidget() {
    return Row(
      children: [
        questionTitleWidget(
            title: Strings.categoryName, fontSize: Dimens.font_16),
        SizedBox(
          width: Dimens.margin_10,
        ),
        questionTitleWidget(
            title: Strings.categoryValue,
            fontSize: Dimens.font_16,
            color: Colors.white.withOpacity(0.7))
      ],
    );
  }

  keywordRequestedWidget() {
    return Row(
      children: [
        questionTitleWidget(
            title: Strings.keywordName, fontSize: Dimens.font_16),
        SizedBox(
          width: Dimens.margin_10,
        ),
        questionTitleWidget(
            title: Strings.keywordValue,
            fontSize: Dimens.font_16,
            color: Colors.white.withOpacity(0.7))
      ],
    );
  }
}
