import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suraj_assignment/AssetsConst.dart';
import 'package:suraj_assignment/color_const.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

//  {START TEXT VIEW}
Text getTxt(
    {required String msg,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(msg,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontWeight: fontWeight));
}

Text getTxtAppColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.APP_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtWhiteColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.WHITE_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtBlackColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.BLACK_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtGreyColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.GREY_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtColor(
    {required String msg,
    required Color txtColor,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: txtColor, fontSize: fontSize, fontWeight: fontWeight),
  );
}

TextStyle _getFontStyle(
    {required Color txtColor,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = str_const.ZILLASLAB_FONT,
    TextDecoration txtDecoration = TextDecoration.none}) {
  return TextStyle(
      color: txtColor,
      fontSize: fontSize,
      decoration: txtDecoration,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

//  {END TEXT VIEW}

AppBar getAppBarWithBackBtn(
    {String title = '',
    Color bgColor = Colors.white,
    double fontSize = 15,
    String titleTag = '',
    Widget? icon,
    List<Widget>? actions}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: icon,
    actions: actions,
    centerTitle: true,
    title: Hero(
        tag: titleTag,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize),
        )),
  );
}

Widget edtPwdField(
    {required TextEditingController control,
    bool pwdVisible = false,
    bool isRect = true,
    Function? pwdVisibleClick}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: Colors.white,
    ),
    child: TextFormField(
      controller: control,

      decoration: InputDecoration(
        fillColor: ColorConst.WHITE_COLOR,
        counterText: '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        border: OutlineInputBorder(
            borderRadius:
                isRect ? BorderRadius.circular(8) : BorderRadius.circular(30)),
        hintText: "Password",
        // prefixIcon: Icon(icons),
        suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              pwdVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.blue,
            ),
            onPressed: () => pwdVisibleClick),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
      obscureText: !pwdVisible,
      textInputAction: TextInputAction.done,
      maxLength: 32,
      // validator: ValidationHelper.validateNormalPass,
    ),
  );
}

Widget raisedRoundColorBtn(String txt, Color color, Function btnClick) =>
    ButtonTheme(
      child: ElevatedButton(
        onPressed: () {
          btnClick();
        },
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: getTxtWhiteColor(
            msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      // child: RaisedButton(
      //   padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
      //   shape: StadiumBorder(),
      //   color: ColorConst.APP_COLOR,
      //   child: getTxtWhiteColor(
      //       msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      //   onPressed: btnClick,
      // ),
    );

Widget dropDownField(
    {String txt = "",
    required TextEditingController edtController,
    Function? click}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 5),
                child: getTxtGreyColor(msg: txt, fontSize: 14),
              ),
              TextFormField(
                onTap: () => click,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  hintText: " - Choose Option -",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                textInputAction: TextInputAction.next,
                maxLength: 32,
                readOnly: true,
                controller: edtController,
                // validator: (dob) => ValidationHelper.empty(dob!, 'Time is Required'),
              ),
            ],
          ),
        ),
        Icon(Icons.keyboard_arrow_down_rounded)
      ],
    ),
  );
}

Widget edtTimeField(TextEditingController edtController, Function timeClick) {
  return TextFormField(
    onTap: () => timeClick,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Select Routes",
      hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: edtController,
    // validator: (dob) => ValidationHelper.empty(dob!, 'Time is Required'),
  );
}

Widget getCacheImage({
  String url = '',
  String assetPath = '',
  Color? colorPath,
  File? filePath,
  double height = double.infinity,
  double width = double.infinity,
  int placeHolder = 0,
  bool isCircle = false,
  bool isShowBorderRadius = false,
  double borderRadius = 2,
  BoxFit fit = BoxFit.cover,
}) {
  var imgWidget;
  var border = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(new Radius.circular(height / 2)),
    border: Border.all(
      color: ColorConst.APP_COLOR,
      width: borderRadius,
    ),
  );
  if (colorPath != null) {
    //Only color show in File
    imgWidget = Container(
      width: width,
      height: height,
      color: colorPath,
    );
  } else if (assetPath.length > 0) {
    //Asset File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: Image.asset(assetPath, fit: fit),
    );
  } else if (filePath != null && filePath.path.length > 0) {
    //Local Device File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: ClipOval(child: Image.file(filePath, fit: fit)),
    );
  } else {
    //Image Remote Url
    Widget cachImg = CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) => getPlaceHolder(placeHolder, height, width),
      errorWidget: (context, url, error) =>
          getPlaceHolder(placeHolder, height, width),
    );
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: isShowBorderRadius ? ClipOval(child: cachImg) : cachImg,
    );
  }
  if (isCircle)
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: imgWidget,
    );
  else
    return imgWidget;
}

Widget getPlaceHolder(int placeHolderPos, double height, double width) {
  switch (placeHolderPos) {
    case 0:
      // LOGO
      return Container(
        width: width,
        height: height,
        child: Image.asset(AssetsConst.LOGO_IMG),
      );
    case 1:
      // Grey Shade
      return Container(
        width: width,
        height: height,
        color: Colors.grey[400],
      );
    // case 2:
    //   // Upload
    //   return Container(
    //     width: width,
    //     height: height,
    //     child: Icon(Icons.upload_file),
    //   );
    default:
      return Container(
        width: width,
        height: height,
        child: Image.asset(AssetsConst.LOGO_IMG),
      );
  }
}
