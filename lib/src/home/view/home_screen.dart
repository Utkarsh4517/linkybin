import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:linkybin/src/home/view/widgets/add_link_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        child: Icon(Icons.add, color: whiteColor, weight: 20),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (context) {
                return AddLinkSheet(textEditingController: textEditingController);
              });
        },
      ),
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
