import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/strings.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var oldpasswordController = TextEditingController();
  var newpasswordController = TextEditingController();
  var confirmwpasswordController = TextEditingController();
  bool isOldVisible = false, isNewVisible = false, isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: HelperUtility.customAppBar(
          context: context, title: Strings.chnagePasswordTxt ?? ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimens.margin_40,
            ),
            oldpasswordFormWidget(),
            newpasswordFormWidget(),
            confirmNewpasswordFormWidget(),
            SizedBox(
              height: Dimens.margin_50,
            ),
            Padding(
              padding: EdgeInsets.all(Dimens.margin_15),
              child: saveButtonWidget(),
            ),
          ],
        ),
      ),
    ));
  }

  oldpasswordFormWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_20,
          right: Dimens.margin_20,
          top: Dimens.margin_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.oldPassworddTxt,
              color: Colors.white.withOpacity(0.7),
              fontSize: Dimens.font_18),
          SizedBox(
            height: Dimens.margin_10,
          ),
          oldpasswordTextFormFeild(),
        ],
      ),
    );
  }

  oldpasswordTextFormFeild() {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.margin_20),
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        controller: oldpasswordController,
        cursorColor: Colors.white,
        obscureText: isOldVisible,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  HelperUtility.hideKeyBoard(context: context);
                  isOldVisible = !isOldVisible;
                });
              },
              child: Transform.scale(
                scale: 0.6,
                child: HelperUtility.assetImage(
                    path: isOldVisible
                        ? Assets.passwordInvisibleImg
                        : Assets.passwordVisibleImg,
                    color: Colors.white.withOpacity(0.9),
                    fit: BoxFit.contain,
                    width: Dimens.margin_20,
                    height: Dimens.margin_20),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  newpasswordFormWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_20,
          right: Dimens.margin_20,
          top: Dimens.margin_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.newPassworddTxt,
              color: Colors.white.withOpacity(0.7),
              fontSize: Dimens.font_18),
          SizedBox(
            height: Dimens.margin_10,
          ),
          newpasswordTextFormFeild(),
        ],
      ),
    );
  }

  newpasswordTextFormFeild() {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.margin_20),
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        controller: newpasswordController,
        cursorColor: Colors.white,
        obscureText: isNewVisible,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  HelperUtility.hideKeyBoard(context: context);
                  isNewVisible = !isNewVisible;
                });
              },
              child: Transform.scale(
                scale: 0.6,
                child: HelperUtility.assetImage(
                    path: isNewVisible
                        ? Assets.passwordInvisibleImg
                        : Assets.passwordVisibleImg,
                    color: Colors.white.withOpacity(0.9),
                    fit: BoxFit.contain,
                    width: Dimens.margin_20,
                    height: Dimens.margin_20),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  confirmNewpasswordFormWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_20,
          right: Dimens.margin_20,
          top: Dimens.margin_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.confPassworddTxt,
              color: Colors.white.withOpacity(0.7),
              fontSize: Dimens.font_18),
          SizedBox(
            height: Dimens.margin_10,
          ),
          confirmpasswordTextFormFeild(),
        ],
      ),
    );
  }

  confirmpasswordTextFormFeild() {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.margin_20),
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        controller: confirmwpasswordController,
        cursorColor: Colors.white,
        obscureText: isOldVisible,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  HelperUtility.hideKeyBoard(context: context);
                  isConfirmVisible = !isConfirmVisible;
                });
              },
              child: Transform.scale(
                scale: 0.6,
                child: HelperUtility.assetImage(
                    path: isConfirmVisible
                        ? Assets.passwordInvisibleImg
                        : Assets.passwordVisibleImg,
                    color: Colors.white.withOpacity(0.9),
                    fit: BoxFit.contain,
                    width: Dimens.margin_20,
                    height: Dimens.margin_20),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  saveButtonWidget() {
    return InkWell(
      onTap: () {},
      child: HelperUtility.roundedButton(
          paddingTB: Dimens.margin_15,
          radius: Dimens.margin_10,
          btnTxt: Strings.doneTxT,
          fontSize: Dimens.font_16),
    );
  }
}
