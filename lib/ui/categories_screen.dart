import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

  class CategoriesScreen extends StatefulWidget {
  String? title;

  CategoriesScreen({this.title});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isSeleced = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  HelperUtility.customAppBar(
            context: context, title: widget.title ?? ""),
        backgroundColor: Colors.black.withOpacity(0.8),
        body: Column(
          children: [

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
                        text: Strings.categoriesText, fontSize: Dimens.font_14),
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
                        text: Strings.newRequestText, fontSize: Dimens.font_14),
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
                left: Dimens.margin_20,
                right: Dimens.margin_20,
                top: Dimens.margin_10,
                bottom: Dimens.margin_5),
            decoration: BoxDecoration(
              color: Colorss.blackShadeColors.withOpacity(0.3),

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
                    HelperUtility.textWidget(text: Strings.values,fontSize: Dimens.font_16),
                     SizedBox(
                      width: Dimens.margin_10,
                    ),
                    Expanded(child: detailAndSateWidget()),

                  ],
                ),
                SizedBox(
                  height: Dimens.margin_10,
                ),
                viewDetailDeteleWidget()
              ],
            ),
          );
        });
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
        Container(
          width: Dimens.margin_50,
          color: Colors.green,
          padding: EdgeInsets.all(Dimens.margin_2),
          child: Center(
            child: HelperUtility.autoResizetextWidget(
                text: Strings.active, fontSize: Dimens.font_10),
          ),
        ),
        SizedBox(
          height: Dimens.margin_3,
        ),
        HelperUtility.autoResizetextWidget(
            text: Strings.computerEngineering, fontSize: Dimens.font_14),
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


  viewDetailDeteleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        eventDateWidget(title: Strings.edit,icon: Assets.editImg),
        SizedBox(
          width: Dimens.margin_10,
        ),
        eventDateWidget(title:Strings.viewDetails,icon: Assets.passwordVisibleImg),
       /* SizedBox(
          width: Dimens.margin_10,
        ),
        eventDateWidget(title:Strings.delete,icon: Assets.deleteImg),*/

      ],
    );
  }
}
