import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: HelperUtility.customAppBar(
                context: context,
                title: Strings.userTxt ?? "",
                centerTitle: false),
            backgroundColor: Colorss.blackShadeColors.withOpacity(0.3),
            body: Column(
              children: [Expanded(child: chatScreenView())],
            )));
  }

  chatScreenView() {
    return Container(
      height: HelperUtility.fullScreenHeight(context: context),
      margin: EdgeInsets.only(top: Dimens.margin_20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.margin_15),
            topRight: Radius.circular(Dimens.margin_15)),
      ),
      child: Column(
        children: [
          listViewWidget(),
          Spacer(),
          chatView(),
        ],
      ),
    );
  }

  listViewWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(Dimens.margin_10),
            child: index == 0 ? rightChatItemWidget() : leftItemChatWidget(),
          );
        });
  }

  rightChatItemWidget() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(Dimens.margin_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.margin_20),
              border: Border.all(width: Dimens.margin_1, color: Colors.white)),
          child: HelperUtility.textWidget(
              text: Strings.messageTxt, fontSize: Dimens.font_14),
        ),
        Spacer()
      ],
    );
  }

  leftItemChatWidget() {
    return Row(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.all(Dimens.margin_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.margin_20),
              border: Border.all(width: Dimens.margin_1, color: Colors.orange)),
          child: HelperUtility.textWidget(
              text: Strings.messageLeftTxt, fontSize: Dimens.font_14),
        ),
      ],
    );
  }

  sendMessageWidget() {
    return Container(
      height: Dimens.margin_60,
      padding: EdgeInsets.all(Dimens.margin_10),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(Dimens.margin_20),
          border: Border.all(width: Dimens.margin_1, color: Colors.white)),
      child: chatView(),
    );
  }

  sendTextWidget() {
    return Container(
      height: Dimens.margin_60,
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  chatView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.margin_25),
          border: Border.all(width: Dimens.margin_1, color: Colors.white)),
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      margin: EdgeInsets.all(Dimens.margin_10),
      height: Dimens.margin_50,
      //width: double.infinity,
      child: Row(
        children: <Widget>[

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter Message",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),

          FloatingActionButton(

            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: Dimens.margin_20,
            ),
            backgroundColor:   Colorss.blackShadeColors.withOpacity(0.3),
            elevation: 0,
          ),
          SizedBox(
            width: Dimens.margin_5,
          ),
          FloatingActionButton(

            onPressed: () {},
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: Dimens.margin_20,
            ),
            backgroundColor: Colors.orange,
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
