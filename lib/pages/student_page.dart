import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class StudentPage extends StatelessWidget {
  StudentPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      backgroundColor: globals.AppColors.myBackgrndColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Text('Welcome ${user.email} to the Student Home Page!',
                  style: globals.TextBoxStyle.myTheme.textTheme.textStyle),
            ]),
          ),
        ),
      ),
    );
  }
}
