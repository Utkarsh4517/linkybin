import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkybin/constants/colors.dart';
import 'package:linkybin/constants/dimensions.dart';
import 'package:linkybin/core/categories.dart';
import 'package:linkybin/src/home/data/model/linkybin.model.dart';
import 'package:linkybin/src/home/data/repo/firebase_repo.dart';
import 'package:linkybin/src/home/view/bloc/home_bloc.dart';
import 'package:linkybin/src/home/view/widgets/add_link_sheet.dart';
import 'package:linkybin/src/home/view/widgets/custom_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  late TabController _tabController;
  String category = 'All';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is TabTappedState) {
          setState(() {
            category = state.catetory;
          });
        }
      },
      builder: (context, state) {
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.035, vertical: getScreenWidth(context) * 0.05),
                  height: getScreenheight(context) * 0.035,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomTab(text: 'All', isSelected: category == 'All'),
                      CustomTab(text: 'Reddit', isSelected: category == 'Reddit'),
                      CustomTab(text: 'Twitter', isSelected: category == 'Twitter'),
                      CustomTab(text: 'Instagram', isSelected: category == 'Instagram'),
                      CustomTab(text: 'Web', isSelected: category == 'Web'),
                      CustomTab(text: 'Facebook', isSelected: category == 'Facebook'),
                      CustomTab(text: 'Youtube', isSelected: category == 'Youtube'),
                      CustomTab(text: 'LinkedIn', isSelected: category == 'LinkedIn'),
                      CustomTab(text: 'TikTok', isSelected: category == 'TikTok'),
                      CustomTab(text: 'Github', isSelected: category == 'Github'),
                      CustomTab(text: 'Pinterest', isSelected: category == 'Pinterest'),
                      CustomTab(text: 'Vimeo', isSelected: category == 'Vimeo'),
                      CustomTab(text: 'Quora', isSelected: category == 'Quora'),
                      CustomTab(text: 'Medium', isSelected: category == 'Medium'),
                      CustomTab(text: 'Tinder', isSelected: category == 'Tinder'),
                      CustomTab(text: 'Bumble', isSelected: category == 'Bumble'),
                      CustomTab(text: 'Others', isSelected: category == 'Others'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.035, vertical: getScreenWidth(context) * 0.05),
                  height: getScreenheight(context) * 0.75,
                  child: StreamBuilder<List<LinkyBinModel>>(
                    stream: FirebaseRepository.fetchLinkyBinModels(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                  
                      List<LinkyBinModel> linkyBinModels = snapshot.data!;
                      return ListView.builder(
                        itemCount: linkyBinModels.length,
                        itemBuilder: (context, index) {
                          final linkyBinModel = linkyBinModels[index];
                          return ListTile(
                            title: Text(linkyBinModel.url),
                            subtitle: Text(linkyBinModel.category),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
