import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidoktan/pages/components/button.dart';
import 'package:sidoktan/pages/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // sign user in
  void signIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // pop loading circle
      // ignore: use_build_context_synchronously
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // Display error message
      if (e.code == 'user-not-found') {
        displayMessage('User not found. Please check your email.');
      } else if (e.code == 'wrong-password') {
        displayMessage('Incorrect password. Please try again.');
      } else {
        displayMessage('Error: ${e.message}');
      }
    } catch (e) {
      // pop loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // Handle other errors
      displayMessage('Error: ${e.toString()}');
    }
  }

  // display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F5FA),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                //logo
                _buildLogo(),

                //welcomeMessage
                _buildWelcomeMessage(),
                const SizedBox(height: 25),

                //Email textField
                MyTextField(
                  controller: emailTextController,
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                //Password textField
                MyTextField(
                  controller: passwordTextController,
                  labelText: 'Password',
                  hintText: 'Please Enter Your Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                // Button
                MyButton(
                  onTap: signIn,
                  text: "Sign In",
                ),

                const SizedBox(height: 10),

                // Go to Registr
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New on our platform?",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: "DMSans",
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B5CDB),
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/img/sidoktan-logo.png',
      color: const Color(0xFF5B5CDB),
      width: 160,
      height: 80,
    );
  }

  Widget _buildWelcomeMessage() {
    return const SizedBox(
      width: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to SiDokTan 👋",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
              color: Color(0xFF666666),
              fontFamily: 'DMSerifDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Please Sign-in to your account",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF999EA1),
              fontFamily: 'DMSans',
            ),
          ),
        ],
      ),
    );
  }
}
