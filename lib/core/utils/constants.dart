import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:quotes/core/utils/app_colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static void showMessage(BuildContext context,
      {required String message, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppColors.primary,
        // الوضع الطبيعي لشكل ال snack bar  هوا تلاصقه بالشاشة من الاسفل fixed
        // behavior: SnackBarBehavior.fixed,
        // شكل ال snack bar العائم بالاسفل floating
        behavior: SnackBarBehavior.floating,

        // ممنوع  اطلاقا استخدام ال margin , width
        // width: 100,
        // margin: EdgeInsets.all(10),
        // اتجاه الا خفاء او انتهاء الsnack bar من اي اتجاه
        dismissDirection: DismissDirection.horizontal,
        // مدة ظهور الsnack bar
        duration: Duration(seconds: 3),
        //  padding: EdgeInsets.all(20),
        elevation: 5,
        // الحدث عند الظهور هل تريد التراجع عن الحدف الخ ...
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {},
          textColor: Colors.white,
        ),
        // لما يظهر ال snack bar  اطبعلي ..
        onVisible: () => print('Visable'),
        // لعمل حواف دائرية للشكل
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
