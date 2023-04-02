import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/core/usecases/usecases.dart';
import 'package:clean_architecture_flutter/features/splash/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeLangCase implements UseCase<bool ,String >{
  final LangRepository langRepository;
  ChangeLangCase({required this.langRepository});
  Future<Either<Failure,bool>> call (String langCode)async =>
  await langRepository.changeLang(langCode: langCode);
}