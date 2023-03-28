import 'package:clean_architecture_flutter/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final Function? onPrees;
  const ErrorWidget({super.key, this.onPrees});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber,
            color: AppColors.primary,
            size: 120,
          ),
        ),
        Text(
          'Something Went Wrong',
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          'Please Try Again',
          style: TextStyle(
              color: AppColors.hint, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        ElevatedButton(
          onPressed: () {
            if (onPrees != null) {
              onPrees!();
            }
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.primary,
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )),
          child: Text(
            'Reload Screen',
            style: TextStyle(color: AppColors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
