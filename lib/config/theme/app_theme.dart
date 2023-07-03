import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFFBDEDE0), // 0
  Color(0xFFBBDBD1), // 1
  Color(0xFFB6B8D6), // 2
  Color(0xFF7E78D2), // 3
  Color(0xFF6F58C9), // 4
  Color(0xFF22577A), // 5
  Color(0xFF38A3A5), // 6
  Color(0xFF57CC99), // 7
  Color(0xFF80ED99), // 8
  Color(0xFFC7F9CC) // 9
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color muust be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  ThemeData getDarkTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
