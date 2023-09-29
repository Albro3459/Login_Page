import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_text_field.dart';
import '../globals.dart' as globals;

class LoginPage extends StatefulWidget {
  // LATERR for registering a new account!
  // final Function()? onTap;
  // const LoginPage({super.key, required this.onTap});

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' || e.code == 'invalid-login-credentials') {
        // print('user-not-found');
        wrongEmailOrPassMessage();
      } else if (e.code == 'missing-password') {
        // print('missing-password');
        missingPassword();
      }
    }
  }

  void wrongEmailOrPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Incorrect Email or Password',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  void missingPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Missing a Password',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: globals.AppColors.myBackgrndColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20),
                // logo
                //Text('$screenWidth, $screenHeight'),

                const Icon(Icons.lock, size: 100),

                const SizedBox(height: 30),

                // Please sign in below

                Text('Welcome',
                    style: globals.TextBoxStyle.myTheme.textTheme.textStyle),

                const SizedBox(height: 5),

                Text('Please sign in below:',
                    style: globals.TextBoxStyle.myTheme.textTheme.textStyle),

                const SizedBox(height: 30),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email:',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password:',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text('Forgot Password', style: globals.AppText.myTextStyle),
                  ]),
                ),

                const SizedBox(height: 15),

                // sign in button
                MyButton(onTap: signUserIn),

                const SizedBox(height: 20),

                // or create account maybe
                Text("Don't have an account?",
                    style: globals.AppText.myTextStyle),

                const SizedBox(height: 2),

                // LATTERRRR: For Registering new accs
                // GestureDetector(
                //   onTap: widget.onTap,
                //   child: const Text(
                //     "Create one!",
                //     style: TextStyle(
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),

                const Text(
                  "Create one!",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
