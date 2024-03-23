import 'package:flutter/material.dart';
import 'package:route_diploma_task/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.lightTheme;

  ThemeSettings(bool isDark){
    if(isDark){
      currentTheme = AppTheme.darkTheme;
    }else {
      currentTheme = AppTheme.lightTheme;
    }
  }

  void toggleTheme()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (currentTheme == AppTheme.lightTheme) {
      currentTheme = AppTheme.darkTheme;
      sharedPreferences.setBool("is_dark", true);
    } else {
      currentTheme = AppTheme.lightTheme;
      sharedPreferences.setBool("is_dark", false);
    }
    notifyListeners();
  }
}



