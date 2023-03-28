import 'package:clean_architecture_flutter/core/usecases/usecases.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/entities/quote.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
   import '../../../../core/error/failures.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  // Either هذا ضمن المكتبة الي نزلناها dartz
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
