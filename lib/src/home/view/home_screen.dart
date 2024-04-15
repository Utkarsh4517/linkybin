import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        surfaceTintColor: whiteColor,
        title: Text(
          'Linkybin',
          style: GoogleFonts.lobster(color: Colors.black, fontSize: getScreenWidth(context) * 0.08),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset('assets/svgs/profile_svgrepo.com.svg'),
          )
        ],
      ),
      drawer: const Drawer(),
      body: const Center(
        child: Text(
          'HomeScreen ',
        ),
      ),
    );
  }
}
