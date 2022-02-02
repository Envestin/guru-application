import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru/utility/assets.dart';
import 'package:guru/utility/dimen.dart';

class HelperUtility {
  static Widget assetImage({path, height, width, color, fit}) {
    return Image.asset(path,
        width: width, height: height, color: color, fit: fit);
  }

  static hideKeyBoard({context}){
    FocusScope.of(context).unfocus();
  }

  static Widget appBar({
    context,
    title,
  }) {
    return AppBar(
      elevation: Dimens.margin_0,
      title: title ?? "",
      leading: const Icon(Icons.menu),
      actions: [
        assetImage(
            path: Assets.splashLogo,
            width: Dimens.width_30,
            height: Dimens.margin_30,
            fit: BoxFit.fill),
        assetImage(
            path: Assets.splashLogo,
            width: Dimens.width_30,
            height: Dimens.margin_30,
            fit: BoxFit.fill)
      ],
    );
  }

  static fullScreenHeight({context}) {
    return MediaQuery.of(context).size.height;
  }

  static fullScreenWidth({context}) {
    return MediaQuery.of(context).size.width;
  }

  static roundImageWithAsset({radius, height, width, fit, path,color}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: assetImage(height: height, width: width, fit: fit, path: path,color: color),
    );
  }

  static textWidget({text, color, fontFamily, fontSize, isBold, maxLines,fontWeight}) {
    return Text(
      text ?? "",
      maxLines: maxLines ?? 1,
      style: TextStyle(fontSize: fontSize, color: color,fontWeight: fontWeight),
    );
  }

  static autoResizetextWidget(
      {text, color, fontFamily, fontSize, isBold, maxLines}) {
    return AutoSizeText(
      text ?? "",
      maxLines: maxLines ?? 1,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }

  static customAppBar({
    context,
    centerTitle,
    title,
  }) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.9,
      centerTitle: centerTitle??true,
      title: Text(title),
    ); /*Padding(
      padding: EdgeInsets.all(Dimens.margin_10),
      child: Row(
        children: [
          iconShow==false?Container(width: 0.0,height: 0.0,):InkWell(
           child:  Icon(
             Icons.arrow_back,
             size: Dimens.margin_25,
           ),
             onTap: (){
           Navigator.of(context).pop();
             },
         ),
          SizedBox(
            width: Dimens.margin_5,
          ),
          textWidget(text: title ?? "", fontSize: Dimens.font_16),

        ],
      ),
    );*/
  }

  static roundedContainer({imagePath}) {
    return Container(
      padding: EdgeInsets.all(Dimens.margin_5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimens.margin_24)),
      child: assetImage(
          path: imagePath, height: Dimens.margin_20, width: Dimens.margin_20),
    );
  }

  static roundedImage({height,width}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.margin_25),
      child: assetImage(
          path: Assets.profileImg,
          height:height?? Dimens.margin_50,
          width: width??Dimens.margin_50),
    );
  }

  static roundedButton({color,radius, btnTxt, imgPath = null, fontSize, paddingTB}) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.margin_12,
          right: Dimens.margin_12,
          top: paddingTB,
          bottom: paddingTB),
      decoration: BoxDecoration(
          color: color??Colors.orange.withOpacity(Dimens.margin_0P8),
          borderRadius: BorderRadius.circular(radius)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgPath != null
              ? assetImage(
                  path: imgPath,
                  width: Dimens.margin_25,
                  height: Dimens.margin_25,
                  color: Colors.white)
              : SizedBox(
                  height: Dimens.margin_0,
                  width: Dimens.margin_0,
                ),
          imgPath != null
              ? SizedBox(
                  width: Dimens.margin_5,
                )
              : SizedBox(
                  height: Dimens.margin_0,
                  width: Dimens.margin_0,
                ),
          autoResizetextWidget(text: btnTxt, fontSize: fontSize)
        ],
      ),
    );
  }

  static divider({height}) {
    return Divider(
      height: height??Dimens.margin_1,
      color: Colors.white.withOpacity(0.7),
      thickness: Dimens.margin_0P8,
    );
  }




  static roundedImageContainer({title,borderColor,imgPath,crossIconPadding,onTab}) {
    return InkWell(
      onTap: (){
        onTab();
      },
      child: Row(
        children: [
          Container(
            height: Dimens.margin_30,
            width: Dimens.margin_30,
           padding: EdgeInsets.all(crossIconPadding),
            decoration: BoxDecoration(
                 border: Border.all(color: borderColor, width: crossIconPadding==0.0?0.0:Dimens.margin_2),
                borderRadius: BorderRadius.circular(Dimens.margin_15)),
          child:assetImage(path: imgPath,width:Dimens.margin_15,height: Dimens.margin_15,color: borderColor,fit: BoxFit.contain ),

          ),
          SizedBox(
            width: Dimens.margin_8,
          ),
          Text(
            title ?? "",
            maxLines: 1,
            style: TextStyle(fontSize:  Dimens.font_22,fontWeight: FontWeight.w300),
          )
         ],
      ),
    );
  }


  static simpleImageContainer({title,borderColor,imgPath,crossIconPadding,onTab,txtColor}) {
    return InkWell(
      onTap: (){
        onTab();
      },
      child: Row(
        children: [
          Container(
            height: Dimens.margin_30,
            width: Dimens.margin_30,
            padding: EdgeInsets.all(crossIconPadding),
            child:assetImage(path: imgPath,width:Dimens.margin_15,height: Dimens.margin_15,color: borderColor,fit: BoxFit.contain ),

          ),
          SizedBox(
            width: Dimens.margin_5,
          ),
          Text(
            title ?? "",
            maxLines: 1,
            style: TextStyle(fontSize:  Dimens.font_22,fontWeight: FontWeight.w300,color: txtColor),
          )
        ],
      ),
    );
  }

}
