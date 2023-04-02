import 'dart:convert';

import 'package:clean_architecture_flutter/core/api/api_consumer.dart';
import 'package:clean_architecture_flutter/core/api/end_points.dart';

import 'package:clean_architecture_flutter/features/random_quote/data/models/quote_model.dart';
// import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  /*ApiConsumer apiConsumer;
  //  late http.Client client;
  // RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  // @override
  // Future<QuoteModel> getRandomQuote() async {
  //   final response = await apiConsumer.get(
  //     EndPoints.randomQuote,
  //   );
  //   return QuoteModel.fromJson(response);
  // }

  @override
  Future<QuoteModel> getRandomQuote() async {
    // final randomQuoteUrl = Uri.parse(EndPoints.randomQuote);
    final response = await apiConsumer.get(EndPoints
            .randomQuote */ /* ,  headers: {'Content-Type': 'application/json'}*/ /*
        );
    return QuoteModel.fromJson(response);
    // if (response.statusCode == 200) {
    //   return QuoteModel.fromJson(json.decode(response.body));
    // } else {
    //   throw ServerException();
    // }
  }*/

  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
    );
    return QuoteModel.fromJson(response);
  }
}
