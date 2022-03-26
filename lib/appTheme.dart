import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: kPrimaryColor,
    buttonColor: kPrimaryColor,
    colorScheme:
        ColorScheme.light(primary: kPrimaryColor, secondary: kPrimaryColor),
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: kPrimaryColor,
    fontFamily: "WorkSans",
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: Color(0xff707070),
    canvasColor: Colors.white,
    backgroundColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    errorColor: kErrorColor,
    textTheme: getTextTheme(),
    primaryTextTheme: getTextTheme(),
    accentTextTheme: getTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.dark(),
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: kPrimaryColor,
    fontFamily: "WorkSans",
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: Color(0xff707070),
    canvasColor: Colors.white,
    backgroundColor: Colors.black,
    errorColor: kErrorColor,
    textTheme: getTextTheme(),
    primaryTextTheme: getTextTheme(),
    accentTextTheme: getTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme getTextTheme() {
  return TextTheme(
    bodyText1: TextStyle(fontFamily: "WorkSans"),
    bodyText2: TextStyle(fontFamily: "WorkSans"),
    headline1: TextStyle(fontFamily: "WorkSans"),
    headline2: TextStyle(fontFamily: "WorkSans"),
    headline3: TextStyle(fontFamily: "WorkSans"),
    headline4: TextStyle(fontFamily: "WorkSans"),
    headline5: TextStyle(fontFamily: "WorkSans"),
    headline6: TextStyle(fontFamily: "WorkSans"),
    subtitle1: TextStyle(fontFamily: "WorkSans"),
    subtitle2: TextStyle(fontFamily: "WorkSans"),
    button: TextStyle(fontFamily: "WorkSans"),
    caption: TextStyle(fontFamily: "WorkSans"),
    overline: TextStyle(fontFamily: "WorkSans"),
  );
}

const kPrimaryColor = Color(0xffF76C6C);
// const kSecondaryColor = Color(0xFFFE9901);
// const kContentColorLightTheme = Color(0xFF1D1D35);
// const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarningColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
