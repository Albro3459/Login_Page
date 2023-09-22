import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class MyButton extends StatelessWidget {
  
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 70),
        decoration: globals.TextButtonStyle.myDecoration,
        child: Center(
          child: Text(
            "Sign In",
            style: globals.TextButtonStyle.myTheme.textTheme.textStyle,
          )
        )
      )
    );
  }
}