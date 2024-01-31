import 'package:flutter/material.dart';
import 'package:test_app/Pages/loginpage.dart';
import 'package:test_app/Pages/signuppage.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool showlogin = true;

  void toggle() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(
        onTap: toggle,
      );
    } else {
      return SignupPage(onTap: toggle);
    }
  }
}
