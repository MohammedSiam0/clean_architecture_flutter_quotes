import 'package:clean_architecture_flutter/config/theme/app_theme.dart';
import 'package:clean_architecture_flutter/core/utils/app_strings.dart';
import 'package:clean_architecture_flutter/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,

      theme: appTheme(),
      // home: const QuoteScreen(),
      // routes:routes ,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
