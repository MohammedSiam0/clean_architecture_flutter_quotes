import 'package:clean_architecture_flutter/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocaleDataSources {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}

class LangLocaleDataSourcesImpl implements LangLocaleDataSources {
  final SharedPreferences sharedPreferences;

  LangLocaleDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, langCode);

  @override
  Future<String?> getSavedLang() async =>
       sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)
          : AppStrings.englishLocale;
}
