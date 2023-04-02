import 'package:clean_architecture_flutter/core/usecases/usecases.dart';
import 'package:clean_architecture_flutter/core/utils/app_strings.dart';
import 'package:clean_architecture_flutter/features/splash/domain/usecases/change_locale.dart';
import 'package:clean_architecture_flutter/features/splash/domain/usecases/get_save_lang.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangCase changeLocaleCase;
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLocaleCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishLocale)));

//get saved Language
  String currentangCode = AppStrings.englishLocale;
  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failurs) => null, (value) {
      currentangCode = value;
      emit(ChangeLocaleState(Locale(currentangCode)));
    });
  }

//Change Language
  Future<void> _changeLang(String langCode) async {
    final response = await changeLocaleCase.call(langCode);
    response.fold((failurs) => debugPrint(AppStrings.cachedFailure), (value) {
      currentangCode = langCode;
      emit(ChangeLocaleState(Locale(currentangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishLocale);
  void toArabic() => _changeLang(AppStrings.arabicLocale);
}
