// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:linkybin/core/categories.dart';
import 'package:linkybin/src/home/data/model/linkybin.model.dart';
import 'package:linkybin/src/home/data/repo/firebase_repo.dart';
import 'package:modular_ui/modular_ui.dart';

class AddLinkSheet extends StatefulWidget {
  const AddLinkSheet({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<AddLinkSheet> createState() => _AddLinkSheetState();
}

class _AddLinkSheetState extends State<AddLinkSheet> {
  final List<bool> _selectedCategory = List.generate(categories.length, (index) => false);
  String category = '';
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
      height: getScreenheight(context) * 0.7,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              MUIPrimaryInputField(
                cursorColor: Colors.black,
                hintText: 'Paste a new link',
                controller: widget.textEditingController,
                filledColor: whiteColor,
              ),
              SizedBox(height: getScreenheight(context) * 0.02),
              Text(
                'Select a category',
                style: GoogleFonts.poppins(
                  fontSize: getScreenWidth(context) * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  String label = entry.value;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: FilterChip(
                      selectedColor: deepBlueColor,
                      label: Text(label),
                      labelStyle: TextStyle(color: _selectedCategory[index] ? Colors.white : Colors.black, fontSize: getScreenWidth(context) * 0.028),
                      checkmarkColor: whiteColor,
                      selected: _selectedCategory[index],
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            _selectedCategory.fillRange(0, _selectedCategory.length, false);
                          }
                          _selectedCategory[index] = value;
                          category = label;
                        });
                      },
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          MUISecondaryButton(
            bgColor: deepBlueColor,
            tappedBgColor: blueColor,
            text: 'Save this link!',
            onPressed: () async {
              final bool result = await FirebaseRepository.saveLink(
                  linkyBinModel: LinkyBinModel(
                url: widget.textEditingController.text,
                category: category,
              ));
              if (result) {
                Navigator.pop(context);
                widget.textEditingController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
