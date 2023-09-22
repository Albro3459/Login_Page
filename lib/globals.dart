library globals;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color myBackgrndColor = CupertinoColors.lightBackgroundGray;
}

class AppText {
  static TextStyle myTextStyle = TextStyle(color: Colors.grey[700]);
}

class TextBoxStyle {
  static CupertinoThemeData myTheme = CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        fontSize: 18,
        backgroundColor: AppColors.myBackgrndColor, // Use a Color here
      ),
    ),
  );
}

class TextButtonStyle {
  static BoxDecoration myDecoration = BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(8),
  );
  static CupertinoThemeData myTheme = CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.myBackgrndColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.black, // Use a Color here
      ),
    ),
  );
}
