// To parse this JSON data, do
//
// final quoteModel = quoteModelFromJson(jsonString);

import 'package:clean_architecture_flutter/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.author,
    required super.id,
    required super.authorSlug,
    required super.content,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        authorSlug: json["authorSlug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "authorSlug": authorSlug,
      };
}
