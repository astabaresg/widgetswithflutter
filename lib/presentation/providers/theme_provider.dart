import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  // Defines the light mode for default
  return ThemeMode.light;
});

// Immutable color list
final colorListProvider = Provider((ref) => colorList);

// A simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// An object of type AppTheme
// ThemeNotifier controls and controls something of type AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Can be a controller to, because controls the changes
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
