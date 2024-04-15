import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:linkybin/src/auth/service/auth_service.dart';
import 'package:modular_ui/modular_ui.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: getScreenheight(context) * 0.3),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Linkybin',
              style: GoogleFonts.lobster(color: Colors.black, fontSize: getScreenWidth(context) * 0.15),
            ),
          ),
          SizedBox(height: getScreenheight(context) * 0.4),
          Container(
            alignment: Alignment.center,
            child: MUISecondaryButton(
              bgColor: blueColor,
              tappedBgColor: deepBlueColor,
              text: 'Continue with google',
              onPressed: () {
                AuthService().continueWithGoogle(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
