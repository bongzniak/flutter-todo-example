import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
);