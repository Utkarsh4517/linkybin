import 'package:flutter/material.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:modular_ui/modular_ui.dart';

class AddLinkSheet extends StatelessWidget {
  const AddLinkSheet({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getScreenheight(context) * 0.02,
        bottom: getScreenheight(context) * 0.05,
        left: getScreenWidth(context) * 0.04,
        right: getScreenWidth(context) * 0.04,
      ),
      width: double.infinity,
      height: getScreenheight(context) * 0.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MUIPrimaryInputField(
            cursorColor: Colors.black,
            hintText: 'Paste a new link',
            controller: textEditingController,
            filledColor: whiteColor,
          ),
          MUISecondaryButton(
            bgColor: blueColor,
            tappedBgColor: deepBlueColor,
            text: 'Save this link!',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
