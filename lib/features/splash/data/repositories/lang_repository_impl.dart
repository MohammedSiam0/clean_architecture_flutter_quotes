import 'package:clean_architecture_flutter/core/error/exceptions.dart';
import 'package:clean_architecture_flutter/features/splash/data/datasources/lang_local_data_sources.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architecture_flutter/core/error/failures.dart';

import '../../domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocaleDataSources langLocaleDataSources;

  LangRepositoryImpl({required this.langLocaleDataSources});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocaleDataSources.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langeCode = await langLocaleDataSources.getSavedLang();
      return Right(langeCode!);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
