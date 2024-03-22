import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../repositories/theme_repo.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepo _themeRepo;

  ThemeProvider(this._themeRepo);

  ThemeData get getTheme => ThemeConfig.allThemes()[_themeRepo.currentTheme];
  int get getIndex => _themeRepo.currentTheme;

  updateThemeIndex(int index) async {
    await _themeRepo.updateTheme(index);
    notifyListeners();
  }
}
