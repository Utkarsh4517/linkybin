import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:linkybin/src/home/view/bloc/home_bloc.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeBloc>(context).add(TabTappedEvent(category: text));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(left: getScreenWidth(context) * 0.02),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? blueColor : grey1,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: getScreenWidth(context) * 0.03,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              color: isSelected ? whiteColor : grey2,
            ),
          ),
        ),
      ),
    );
  }
}
