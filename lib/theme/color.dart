import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF5FBFF),
  primaryColor: const Color(0xff1C274C),
  canvasColor: const Color(0xff635FEA),
  secondaryHeaderColor: const Color(0xffE5F3FD),
  disabledColor: const Color(0xffa2a7ad),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0xffffffff),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xffFF0000),
    ),
  ),
  textTheme: GoogleFonts.interTextTheme(),
);
