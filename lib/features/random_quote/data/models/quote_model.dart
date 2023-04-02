import 'package:clean_architecture_flutter/features/random_quote/domain/entities/quote.dart';
import 'dart:convert';

// List<QuoteModel> quoteModelFromJson(String str) =>
//     List<QuoteModel>.from((json.decode(str) as List<dynamic>)
//         .map((x) => QuoteModel.fromJson(x as Map<String, dynamic>))).toList();
/*List<QuoteModel> quoteModelFromJson(String str) =>
    (json.decode(str) as List<dynamic>)
        .map((x) => QuoteModel.fromJson(x as Map<String, dynamic>))
        .toList();*/
// String quoteModelToJson(List<QuoteModel> data) =>
//     json.encode(List<String>.from(data.map((x) => x.toJson())));

class QuoteModel extends Quote {
  QuoteModel({
    required super.id,
    required super.content,
    required super.author,
    // super.tags,
    required super.authorSlug,
    super.length,
  });

  factory QuoteModel.fromJson(List<dynamic> json) {
    final quote = json[0];
    return QuoteModel(
      id: quote['_id'],
      content: quote['content'],
      author: quote['author'],
      // tags: List<dynamic>.from(quote['tags']),
      authorSlug: quote['authorSlug'],
      length: quote['length'],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        // "tags": List<dynamic>.from(tags!.map((x) => x as Map<String, dynamic>)),
        "authorSlug": authorSlug,
        "length": length,
      };
}
