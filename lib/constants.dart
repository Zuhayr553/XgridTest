import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const spacer = 10;

const primarycolor = Color(0xFF212121);
const secondarycolor = Color(0xFF373737);
const lightprimary = Color(0xFFFFFFFF);
const lightsecondary = Color(0xFFF3F7FB);
const coloracc = Color(0xFFFFC107);

final titletext = TextStyle(
  fontSize: ScreenUtil().setSp(spacer.w * 1.7),
  fontWeight: FontWeight.w600,
);

final caption = TextStyle(
  fontSize: ScreenUtil().setSp(spacer.w * 1.3),
  fontWeight: FontWeight.w100,
);

final button = TextStyle(
  fontSize: ScreenUtil().setSp(spacer.w * 1.5),
  fontWeight: FontWeight.w400,
  color: primarycolor,
);

final darktheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: primarycolor,
  canvasColor: primarycolor,
  backgroundColor: secondarycolor,
  accentColor: coloracc,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: lightsecondary,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: lightsecondary,
        displayColor: lightsecondary,
      ),
);

final lighttheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: lightprimary,
  canvasColor: lightprimary,
  backgroundColor: lightsecondary,
  accentColor: coloracc,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: secondarycolor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: secondarycolor,
        displayColor: secondarycolor,
      ),
);
