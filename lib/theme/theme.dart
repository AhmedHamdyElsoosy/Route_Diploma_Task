import 'package:flutter/material.dart';

class AppTheme{
  static bool isDark = false;
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xff060e1e);
  static Color darkSecondary = Color(0xffFACC1D);


  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold
        )
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: lightPrimary,
      primary: lightPrimary,
      secondary:Color(0xffB7935F).withOpacity(0.57),
      onPrimary: Colors.white,
      onSecondary: Colors.black,

    ),
    cardTheme: CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.all(20),
      elevation: 20,
    ),
    dividerColor: lightPrimary,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
        labelMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20
        ),
        labelSmall: TextStyle(
            fontSize: 16,
            color: Colors.black
        ),
        labelLarge: TextStyle(
            fontSize: 20,
            color: lightPrimary
        )
    ),
    useMaterial3: true,
  );


  static ThemeData darkTheme = ThemeData(
    cardTheme: CardTheme(
        color: darkPrimary,
        margin: EdgeInsets.all(20),
        elevation: 20,
        surfaceTintColor: Colors.transparent
    ),
    scaffoldBackgroundColor: darkPrimary,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: darkSecondary,
      primary: darkPrimary,
      secondary:darkSecondary,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    dividerColor: darkSecondary,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
        labelMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
        bodyMedium: TextStyle(
            color: darkSecondary,
            fontWeight: FontWeight.w400,
            fontSize: 20
        ),
        labelSmall: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
        labelLarge: TextStyle(
            fontSize: 20,
            color: darkSecondary
        )
    ),
    useMaterial3: true,
  );
}