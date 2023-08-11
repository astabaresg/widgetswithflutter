import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFF785964), // 0
  Color(0xFF464d77), // 1
  Color(0xFF232E21), // 2
  Color(0xFF7E78D2), // 3
  Color(0xFF6F58C9), // 4
  Color(0xFF22577A), // 5
  Color(0xFF38A3A5), // 6
  Color(0xFF57CC99), // 7
  Color(0xFF80ED99), // 8
  Color(0xFFFF3C38) // 9
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  ThemeData getDarkTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  AppTheme copyWith({int? selectedColor}) =>
      AppTheme(selectedColor: selectedColor ?? this.selectedColor);
}
