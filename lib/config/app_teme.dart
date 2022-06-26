import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    primaryColor: const Color(0xff016bf4),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
    ),
  );
}
