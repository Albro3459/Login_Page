import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_text_field.dart';
import '../globals.dart' as globals;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username:',
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

                Text("Create one!",
                    style: TextStyle(
                        color: Colors.grey[700],
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
