import 'package:equatable/equatable.dart';

// نزلت مكتبة علشان قصة المقارنة بين الداتا المتسابهة في نفس الكلاس
class Quote extends Equatable {
  final String author;
  final String id;
  final String content;
  final String authorSlug;
  const Quote(
      {required this.author,
      required this.id,
      required this.content,
      required this.authorSlug});

  @override
  List<Object?> get props => [author, id, content, authorSlug];
}

// This class is the Entities (Enterprise Business Rules) is the class we define the attribute of the data we get from the api
