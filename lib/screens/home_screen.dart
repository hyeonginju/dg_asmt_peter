import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:dg_asmt_peter/theme/app_icons.dart';
import 'package:dg_asmt_peter/widgets/custom_search_bar.dart';
import 'package:dg_asmt_peter/widgets/header_text.dart';
import 'package:dg_asmt_peter/widgets/multi_select_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    'Tents',
    'Sleeping bags',
    'Backpacks',
    'Hiking boots',
    'Camping gear',
    'Water bottles',
    'Flashlights',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(78),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [AppColors.appbarColorStart, AppColors.appbarColorEnd],
            ),
          ),
          child: AppBar(
            toolbarHeight: 78,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image.asset(AppIcons.logo, height: 48, width: 48),
              ),
            ),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(AppIcons.menu, height: 36, width: 36),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [AppColors.mainColorStart, AppColors.mainColorEnd],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              HeaderText(
                title: 'Highly packable, weatherproof outdoor equipment',
              ),
              CustomSearchBar(),
              MultiSelectButtons(items: items),
            ],
          ),
        ),
      ),
    );
  }
}
