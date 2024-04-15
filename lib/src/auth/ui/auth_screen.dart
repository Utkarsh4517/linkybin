import 'package:flutter/material.dart';
import 'package:linkybin/shared/custom_button.dart';
import 'package:linkybin/src/auth/service/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomButton(
          text: 'Continue with google',
          function: () {
            AuthService().continueWithGoogle(context);
          }),
    ));
  }
}
