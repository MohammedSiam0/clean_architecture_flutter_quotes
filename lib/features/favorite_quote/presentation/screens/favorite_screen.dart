import 'package:clean_architecture_flutter/core/utils/app_colors.dart';
import 'package:clean_architecture_flutter/core/utils/constants.dart';
import 'package:clean_architecture_flutter/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoriteQuoteScreen extends StatelessWidget {
  const FavoriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () =>
                Constants.showErrorDialog(context: context, msg: 'Error'),
            child: Center(
                child: Text(
              'Show Error Dialog',
              style: TextStyle(fontSize: 26, color: AppColors.black),
            )),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => Constants.showMessage(context,
                message: 'Show Toast', color: AppColors.black),
            child: Center(
                child: Text(
              'Show Toast Message',
              style: TextStyle(fontSize: 26, color: AppColors.black),
            )),
          ),
        ],
      ),
    );
  }
}
