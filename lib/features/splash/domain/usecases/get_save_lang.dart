import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/core/usecases/usecases.dart';
import 'package:clean_architecture_flutter/features/splash/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class GetSavedLangUseCase implements UseCase<String,NoParams>{
  final LangRepository langRepository;
  GetSavedLangUseCase({required this.langRepository});
  
  @override
  Future<Either<Failure, String >> call(NoParams params) async =>
  await langRepository.getSavedLang();
}