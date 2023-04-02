import 'package:clean_architecture_flutter/config/locale/app_localizations.dart';
import 'package:clean_architecture_flutter/config/locale/app_localizations_setup.dart';
import 'package:clean_architecture_flutter/config/theme/app_theme.dart';
import 'package:clean_architecture_flutter/core/utils/app_strings.dart';
import 'package:clean_architecture_flutter/config/routes/app_routes.dart';
import 'package:clean_architecture_flutter/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // علشان تشتغل مع تشغيل التطبيق يعني يضل حافظ شو حالة الللغة getSavedLang
        providers: [
          BlocProvider(
              create: (contect) => di.sl<LocaleCubit>()..getSavedLang())
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: ((context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              locale: state.locale,
              theme: appTheme(),
              // home: const QuoteScreen(),
              // routes:routes ,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
            );
          }),
        ));
  }
}
