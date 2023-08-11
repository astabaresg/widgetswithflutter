import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  // Define tu tema claro como tema inicial
  return ThemeMode.light;
});

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 0);
