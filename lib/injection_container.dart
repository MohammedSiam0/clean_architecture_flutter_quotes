import 'package:clean_architecture_flutter/core/api/app_interceptor.dart';
import 'package:clean_architecture_flutter/core/network/netwok_info.dart';
import 'package:clean_architecture_flutter/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_architecture_flutter/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/usecases/get_rendom_quote.dart';
import 'package:clean_architecture_flutter/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? Features
  // Blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

  // Repository
  GetIt.instance.registerLazySingleton<QuoteRepository>(() =>
      QuoteRepositoryImpl(
          networkInfo: sl(),
          randomQuoteRemoteDataSource: sl(),
          randomQuoteLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  GetIt.instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
