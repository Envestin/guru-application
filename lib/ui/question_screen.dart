import 'package:flutter/material.dart';
import 'package:guru/ui/user_profile_screen.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';
import 'package:readmore/readmore.dart';

class QuestionScreen extends StatefulWidget {
  String? title;

  QuestionScreen({this.title});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorss.textFieldColor1.withOpacity(0.3),
        appBar:
            HelperUtility.customAppBar(context: context, title: widget?.title),
        body: Column(
          children: [Expanded(child: questionList())],
        ),
      ),
    );
  }

  questionList() {
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                provideDetailsWidget(),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                Align(
                  child: questionTitleWidget(
                      title: Strings.question, fontSize: Dimens.font_16),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                questionValueWidget(),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                Row(
                  children: [
                    questionDateWidget(
                        icon: Assets.timeImg, title: Strings.createdOnValue),
                    Spacer(),
                    questionDateWidget(
                        icon: Assets.deleteImg,
                        color: Colors.red,
                        title: Strings.questions)
                  ],
                )
              ],
            ),
          );
        });
  }

  questionTitleWidget({title, fontSize}) {
    return HelperUtility.textWidget(
        text: title, fontSize: fontSize, color: Colors.white);
  }

  questionValueWidget() {
    return Strings.lDummyTxt.length > 100
        ? ReadMoreText(
      "",
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    )
        : HelperUtility.textWidget(
            text: Strings.lDummyTxt,
            fontSize: Dimens.font_14,
            color: Colors.white.withOpacity(0.7),
            maxLines: 2,
            fontWeight: FontWeight.w400);
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

  questionDateWidget({icon, title, color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HelperUtility.assetImage(
            path: icon,
            color: color ?? Colors.white,
            height: Dimens.margin_18,
            width: Dimens.margin_18),
        SizedBox(
          width: Dimens.margin_5,
        ),
        HelperUtility.autoResizetextWidget(
            text: title ?? "", fontSize: Dimens.font_12)
      ],
    );
  }
}
