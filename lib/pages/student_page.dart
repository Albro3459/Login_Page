import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.AppColors.myBackgrndColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Welcome to the Student Home Page!',
                  style: globals.TextBoxStyle.myTheme.textTheme.textStyle
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}