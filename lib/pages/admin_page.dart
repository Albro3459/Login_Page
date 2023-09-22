import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

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
                  'Welcome to the Admin Home Page!',
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