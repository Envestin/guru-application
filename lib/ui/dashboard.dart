import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/models/home_model.dart';
import 'package:guru/ui/categories_screen.dart';
import 'package:guru/ui/event_screen.dart';
import 'package:guru/ui/monthly_chart.dart';
import 'package:guru/ui/question_screen.dart';
import 'package:guru/ui/user_list.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

 import 'dispute_screen.dart';
import 'keyword_request.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<HomeModel> mhomeList = [];

  @override
  void initState() {
    initialisedList();
    // TODO: implement initState
    super.initState();
  }

  initialisedList() {
    mhomeList.add(HomeModel(
        title: Strings.userHomeTxt,
        imgPath: Assets.userImg,
        count: 10,
        color: Colorss.userImgBgColor));
    mhomeList.add(HomeModel(
        title: Strings.disputeHomeTxt,
        imgPath: Assets.disputeImg,
        count: 10,
        color: Colorss.disputeImgBgColor));
    mhomeList.add(HomeModel(
        title: Strings.categoriesHomeTxt,
        imgPath: Assets.categoriesImg,
        count: 10,
        color: Colorss.categoriesImgBgColor));
    mhomeList.add(HomeModel(
        title: Strings.questionsHomeTxt,
        imgPath: Assets.keywordImg,
        count: 10,
        color: Colorss.keywordImgBgColor));
    mhomeList.add(HomeModel(
        title: Strings.eventsHomeTxt,
        imgPath: Assets.eventsImg,
        count: 10,
        color: Colorss.eventsImgBgColor));
    mhomeList.add(HomeModel(
        title: Strings.keywordHomeTxt,
        imgPath: Assets.keywordRequestImg,
        count: 10,
        color: Colorss.keywordRequestImgBgColor));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Padding(
        padding: EdgeInsets.all(Dimens.margin_10),
        child: Column(
          children: [
            profileSectionWidget(),
            reportWidget(),
            Expanded(
              child: listViewWidget(),
            ),
          ],
        ),
      ),
    ));
  }

  profileSectionWidget() {
    return Padding(
      padding: EdgeInsets.all(Dimens.margin_10),
      child: Row(
        children: [
          onlineImageWidget(),
          SizedBox(
            width: Dimens.margin_10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelperUtility.textWidget(
                  text: Strings.admin, fontSize: Dimens.font_20),
              HelperUtility.textWidget(
                  text: Strings.username + ": " + Strings.usernameId,
                  fontSize: Dimens.font_14)
            ],
          ))
        ],
      ),
    );
  }

  onlineImageWidget() {
    return Stack(
      children: [
        HelperUtility.roundedImage(),
        Positioned(
            top: 10,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(Dimens.margin_5),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(Dimens.margin_5)),
            ))
      ],
    );
  }

  reportWidget() {
    return Container(
      padding: EdgeInsets.all(Dimens.margin_10),
      margin: EdgeInsets.all(Dimens.margin_10),
      decoration: BoxDecoration(
          color: Colorss.blackShadeColors.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Dimens.margin_5)),
      width: HelperUtility.fullScreenWidth(context: context),
      //height: Dimens.margin_200,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: HelperUtility.textWidget(
                text: Strings.amount + ": " + Strings.price,
                color: Colors.white,
                fontSize: Dimens.font_14),
          ),
          Container(
            height: Dimens.margin_150,
            child:  MonthChart(isShowingMainData: true),
          ),
          Align(
            alignment: Alignment.topRight,
            child: HelperUtility.textWidget(
                text: Strings.detailed,
                color: Colors.white,
                fontSize: Dimens.font_14),
          )
        ],
      ),
    );
  }

  listViewWidget() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1.2,
      children: List.generate(mhomeList.length, (index) {
        return InkWell(
          onTap: () {
            if (mhomeList[index].title == "Disputes") {
              ScreenUtils.pushScreen(
                  context: context,
                  screen: DisputeScreen(
                    title: mhomeList[index].title,
                  ));
            } else if (mhomeList[index].title == "Users") {
              ScreenUtils.pushScreen(
                  context: context,
                  screen: UserScreen(title: mhomeList[index].title));
            } else if (mhomeList[index].title == "Scheduled Events") {
              //CategoriesScreen
              ScreenUtils.pushScreen(
                  context: context,
                  screen: CategoriesScreen(
                    title: mhomeList[index].title,
                  ));
            }else if (mhomeList[index].title == "Questions") {
              //CategoriesScreen
              ScreenUtils.pushScreen(
                  context: context,
                  screen: QuestionScreen(
                    title: mhomeList[index].title,
                  ));
            }else if(mhomeList[index].title ==Strings.keywordHomeTxt){
              ScreenUtils.pushScreen(context: context,screen: KeywordRequestScreen(title: mhomeList[index].title ,));
            }
          },
          child: Container(
            height: Dimens.margin_50,
            decoration: BoxDecoration(
                color: Colorss.blackShadeColors.withOpacity(0.3),
                borderRadius: BorderRadius.circular(Dimens.margin_10)),
            padding: EdgeInsets.all(Dimens.margin_10),
            margin: EdgeInsets.all(Dimens.margin_10),
            child: cardItemWidget(mhomeList[index]),
          ),
        );
      }),
    );
  }

  cardItemWidget(HomeModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        roundBorderImage(model.imgPath, model.color),
        SizedBox(
          height: Dimens.margin_5,
        ),
        HelperUtility.textWidget(
            text: model.count?.toString(), fontSize: Dimens.font_20),
        HelperUtility.textWidget(text: model.title, fontSize: Dimens.font_14)
      ],
    );
  }

  roundBorderImage(pathImg, colorCode) {
    return Container(
      height: Dimens.margin_50,
      width: Dimens.margin_50,
      padding: EdgeInsets.all(Dimens.margin_5),
      decoration: BoxDecoration(
          color: colorCode,
          borderRadius: BorderRadius.circular(Dimens.margin_25)),
      child: Transform.scale(
        scale: 0.8,
        child: HelperUtility.roundImageWithAsset(
            path: pathImg,
            radius: Dimens.margin_20,
            width: Dimens.margin_40,
            height: Dimens.margin_40,
            color: Colors.white,
            fit: BoxFit.cover),
      ),
    );
  }
}
