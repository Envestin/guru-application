import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

class EventScreen extends StatefulWidget {


  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Column(
        children: [Expanded(child: eventCardList())],
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
                SizedBox(height: Dimens.margin_5,),

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
                    SizedBox(
                      width: Dimens.margin_5,
                    ),
                    Padding(padding: EdgeInsets.only(top: 0.0),
                    child: priceAndValueWidget(),
                    )
                  ],
                ),
                SizedBox(height: Dimens.margin_5,),
                viewDetailDeteleWidget()
              ],
            ),
          );
        });
  }
  
  
  userImageWidget(){
    return Container(
      padding: EdgeInsets.all(Dimens.margin_1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.margin_20),
      ),
        child:  HelperUtility.roundedImage(
          height: Dimens.margin_40, width: Dimens.margin_40),
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
            text: Strings.dummyEvent, fontSize: Dimens.font_13),
        SizedBox(
          height: Dimens.margin_5,
        ),
        HelperUtility.autoResizetextWidget(
            text: Strings.eventState + ": "+ Strings.eventStateName, fontSize: Dimens.font_14),

      ],
    );
  }

  eventOraganisedNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HelperUtility.autoResizetextWidget(
            text: Strings.guruName, fontSize: Dimens.font_13),
        SizedBox(
          height: Dimens.margin_5,
        ),
        Row(
          children: [
           HelperUtility.assetImage(path: Assets.profileIconImg,width: Dimens.margin_18,height: Dimens.margin_18,color: Colors.white),
            SizedBox(
              width: Dimens.margin_5,
            ),
            Expanded(
                child: HelperUtility.textWidget(color: Colors.white.withOpacity(0.5),
                    text: Strings.guruNameValue, fontSize: Dimens.font_13))
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
        HelperUtility.autoResizetextWidget(color: Colors.white.withOpacity(0.5),
            text: Strings.price, fontSize: Dimens.font_13)
      ],
    );
  }

  viewDetailDeteleWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      eventDateWidget(title:Strings.viewDetails,icon: Assets.passwordVisibleImg),
     /* SizedBox(width: Dimens.margin_5,),
      eventDateWidget(title:Strings.delete,icon: Assets.deleteImg),*/
    ],
  );
  }

}
