import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
          color: AppColors.white,
        ),
        title,
      ),
    );
  }
}
