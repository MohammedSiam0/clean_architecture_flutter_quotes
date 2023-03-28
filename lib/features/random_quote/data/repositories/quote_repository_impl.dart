import 'package:clean_architecture_flutter/core/error/exceptions.dart';
import 'package:clean_architecture_flutter/core/network/netwok_info.dart';
import 'package:clean_architecture_flutter/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_architecture_flutter/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/entities/quote.dart';
import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteRemoteDataSource,
      required this.randomQuoteLocalDataSource});
/*
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    */
/* if (is connecteed)
    {
      Get Data Form Api 
    }else {
      Get Data From Cache
    }
    */ /*


    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote); // Right تبعت الeither
      } on ServerException {
        return Left(ServerFailure()); // Left تبعت الeither
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
*/

  // This fun is check on network if isConnect get Data from dataSource else is Offline getData from Cache
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote = await randomQuoteRemoteDataSource
            .getRandomQuote(); // if there is network go to fun in remote file and impel it
        randomQuoteLocalDataSource
            .cacheQuote(remoteRandomQuote); // save Last data on LocalDataSource
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

//! Explination
/*
This code defines an implementation of the QuoteRepository interface. The QuoteRepository is responsible for abstracting the data source
layer (local and remote) from the domain layer. It also provides an abstraction layer over the data source layer,
so that the data can be retrieved and saved in a consistent way, regardless of the specific implementation.

The QuoteRepositoryImpl class takes in the following parameters:

networkInfo: an instance of the NetworkInfo class, which is used to determine if the device is currently connected to the internet.
randomQuoteRemoteDataSource: an instance of the RandomQuoteRemoteDataSource class, which is used to retrieve random quotes from a 
remote data source (in this case, an API).
randomQuoteLocalDataSource: an instance of the RandomQuoteLocalDataSource class, which is used to retrieve cached quotes from a local data
source (in this case, SharedPreferences).
The getRandomQuote method is used to retrieve a random quote. If the device is connected to the internet, the method retrieves the quote
from the remote data source by calling the getRandomQuote method on the RandomQuoteRemoteDataSource instance. If the retrieval is successful,
the quote is cached by calling the cacheQuote method on the RandomQuoteLocalDataSource instance and returned as a Right value in an Either
object. If there is a server error, a Left value containing a ServerFailure object is returned.

If the device is not connected to the internet, the method retrieves the quote from the local data source by calling the getLastRandomQuote
method on the RandomQuoteLocalDataSource instance. If the retrieval is successful, the cached quote is returned as a Right value in an
Either object. If there is a cache error, a Left value containing a CacheFailure object is returned.
 */
