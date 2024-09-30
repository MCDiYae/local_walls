import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: Colors.grey, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: Colors.blue),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[200],
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
