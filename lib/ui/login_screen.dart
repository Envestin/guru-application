import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/colors.dart';
import 'package:guru/utility/dimen.dart';
import 'package:guru/utility/helper_utility.dart';
import 'package:guru/utility/screen_utils.dart';
import 'package:guru/utility/strings.dart';

import 'dashboard.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = false,isCheck=true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoImage(),
            SizedBox(
              height: Dimens.margin_8,
            ),
            emailFormWidget(),
            passwordFormWidget()
          ],
        ),
      ),
    ));
  }

  logoImage() {
    return Padding(
        padding: EdgeInsets.only(
            left: Dimens.margin_20,
            right: Dimens.margin_20,
            top: Dimens.margin_60),
        child: Center(
          child: HelperUtility.assetImage(
              path: Assets.splashLogo, width: Dimens.margin_250),
        ));
  }

  emailFormWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_20,
          right: Dimens.margin_20,
          top: Dimens.margin_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.email,
              color: Colors.white.withOpacity(0.7),
              fontSize: Dimens.font_18),
          SizedBox(
            height: Dimens.margin_10,
          ),
          emailTextFormFeild()
        ],
      ),
    );
  }

  emailTextFormFeild() {
    return Container(
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        controller: emailController,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  passwordFormWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.margin_20,
          right: Dimens.margin_20,
          top: Dimens.margin_15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperUtility.textWidget(
              text: Strings.password,
              color: Colors.white.withOpacity(0.7),
              fontSize: Dimens.font_18),
          SizedBox(
            height: Dimens.margin_10,
          ),
          passwordTextFormFeild(),
          rememberMeWidget(),
          SizedBox(
            height: Dimens.margin_60,
          ),
          loginButtonWidget()

        ],
      ),
    );
  }


  loginButtonWidget(){
    return InkWell(
      onTap: (){
        ScreenUtils.pushRemoveUntilScreen(context: context,screen: MainScreen() );

      },
      child:  HelperUtility.roundedButton(
          paddingTB: Dimens.margin_15,
          radius: Dimens.margin_10,
          btnTxt: Strings.login,

          fontSize: Dimens.font_16),
    );
  }

  passwordTextFormFeild() {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.margin_20),
      decoration: BoxDecoration(
        color: Colorss.textFieldColor1,
      ),
      child: TextFormField(
        controller: passwordController,
        cursorColor: Colors.white,
        obscureText: isVisible,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(

            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                 HelperUtility. hideKeyBoard(context: context);
                 isVisible=!isVisible;
                });
              },
              child:Transform.scale(scale: 0.6,child:  HelperUtility.assetImage(
                  path: isVisible
                      ? Assets.passwordInvisibleImg
                      : Assets.passwordVisibleImg,
                  color: Colors.white.withOpacity(0.9),
                  fit: BoxFit.contain,
                  width: Dimens.margin_20,
                  height: Dimens.margin_20),),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.margin_15)),
      ),
    );
  }

  rememberMeWidget(){
    return Row(
      children: [
        checkBoxWidget(),
        SizedBox(
          width: Dimens.margin_10,
        ),
        HelperUtility.textWidget(text: Strings.remember,fontSize: Dimens.font_16,color: Colors.white.withOpacity(0.7))

      ],
    );
  }

  checkBoxWidget(){
    return InkWell(
     onTap: (){
       setState(() {
         isCheck=!isCheck;
       });
     },

      child: Container(
        child:  HelperUtility.assetImage(
            path: isCheck
                ? Assets.rememberNotImg
                : Assets.rememberImg,
             fit: BoxFit.contain,
            width: Dimens.margin_20,
            height: Dimens.margin_20),
      ),
    );
  }
}
