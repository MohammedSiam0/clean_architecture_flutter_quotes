import 'package:clean_architecture_flutter/core/utils/app_colors.dart';
import 'package:clean_architecture_flutter/features/random_quote/domain/entities/quote.dart';

import 'package:flutter/material.dart';

class QuoteContect extends StatelessWidget {
  final Quote quote;
  const QuoteContect({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Text(
            quote.content!,
            textAlign: TextAlign.center,
            style:

                /*TextStyle(
            fontSize: 22,
            height: 1.3,   // استبدلت كل هذا بالي تحت لانه عرفت المقاسات في الثيم
            color: AppColors.white,
            fontFamily: AppStrings.fontName)*/

                Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              quote.author!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
    // Container(
  }
}
