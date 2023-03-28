import 'package:clean_architecture_flutter/core/utils/app_colors.dart';
import 'package:clean_architecture_flutter/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      fontFamily: AppStrings.fontName,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 22,
            height: 1.3,
            color: AppColors.white,
            fontFamily: AppStrings.fontName),
        /*button: TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400)*/
      ));
}
