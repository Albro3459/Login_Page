import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/pages/admin_page.dart';
import 'package:loginpage/pages/login_page.dart';
import 'package:loginpage/pages/student_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String securityCheck(String email) {
    if (email == 'admin@gmail.com') {
      return 'admin';
    } else if (email == 'student@gmail.com') {
      return 'student';
    } else {
      return 'false';
    }
  }

  bool isAdmin = false;

  bool isStudent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User? user = snapshot.data;
                  isAdmin = false;
                  isStudent = false;

                  if (user != null) {
                    // User is authenticated.
                    String userEmail = user.email ?? '';

                    String role = securityCheck(userEmail);

                    if (role == 'admin') {
                      isAdmin = true;
                      return AdminPage();
                    } else if (role == 'student') {
                      isStudent = true;
                      return StudentPage();
                    }
                  }
                }
              }
              // user is NOT logged in
              return LoginPage();
            }));
  }
}
