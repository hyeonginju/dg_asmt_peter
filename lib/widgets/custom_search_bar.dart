import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SearchBar(
        hintText: 'Search..',
        backgroundColor: WidgetStateProperty.all(Color(0xFF75AAAB)),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        hintStyle: WidgetStateProperty.all(
          TextStyle(color: AppColors.white, fontWeight: FontWeight.normal),
        ),
        constraints: BoxConstraints(minHeight: 37, maxHeight: 37),
        trailing: [Icon(Icons.search, color: AppColors.white)],
      ),
    );
  }
}
