import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MultiSelectButtons extends StatefulWidget {
  final List<String> items;
  const MultiSelectButtons({super.key, required this.items});

  @override
  _MultiSelectButtonsState createState() => _MultiSelectButtonsState();
}

class _MultiSelectButtonsState extends State<MultiSelectButtons> {
  List<bool> selectedItems = [];
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    selectedItems = List.filled(widget.items.length, false);
  }

  void _onAllItemsPressed() {
    setState(() {
      isAllSelected = !isAllSelected;
      selectedItems = List.filled(widget.items.length, isAllSelected);
    });
  }

  void _onItemPressed(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];

      if (selectedItems.every((selected) => selected)) {
        isAllSelected = true;
      } else {
        isAllSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 15),
            _buildButton(
              text: 'All items',
              isSelected: isAllSelected,
              onPressed: _onAllItemsPressed,
            ),

            ...widget.items.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;

              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: _buildButton(
                  text: item,
                  isSelected: selectedItems[index],
                  onPressed: () => _onItemPressed(index),
                ),
              );
            }),

            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.mainColorDeep
            : AppColors.mainColorLight,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      ),
    );
  }
}
