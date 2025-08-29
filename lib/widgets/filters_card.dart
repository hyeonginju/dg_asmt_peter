import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FiltersCard extends StatefulWidget {
  const FiltersCard({super.key});

  @override
  _FiltersCardState createState() => _FiltersCardState();
}

class _FiltersCardState extends State<FiltersCard> {
  List<String> categoryItems = [
    'iOS',
    'Android',
    'Frontend',
    'Backend',
    'Network',
    'UI/UX',
  ];
  List<bool> categorySelected = [true, true, false, false, false, true];

  double salaryValue = 20.0;

  String selectedLevel = 'Mid';
  List<String> levelOptions = ['Entry', 'Mid', 'Staff', 'Senior', 'Manager'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double lineWidth = screenWidth - 60;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF75AAAB).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Filters',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          // Category Section
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          // Category Chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: categoryItems.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              bool isSelected = categorySelected[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    categorySelected[index] = !categorySelected[index];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.mainColorDeep
                        : Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : AppColors.mainColorDeep,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),

          // Salary Range section
          const Text(
            'Salary Range',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: lineWidth,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
              // Slider
              SizedBox(
                width: lineWidth,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 5,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withValues(alpha: 0.2),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                    trackShape: const RoundedTrackSlider(),
                  ),
                  child: Slider(
                    value: salaryValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        salaryValue = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('100', style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),

          const SizedBox(height: 10),

          // Level Section
          const Text(
            'Level',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 15,
            runSpacing: 24,
            children: levelOptions.map((level) {
              final bool isSelected = selectedLevel == level;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = level;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 13),
                    Text(
                      level,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColorDeep,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundedTrackSlider extends SliderTrackShape {
  const RoundedTrackSlider();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    bool isEnabled = true,
    bool isDiscrete = false,
    TextDirection textDirection = TextDirection.ltr,
    Offset? secondaryOffset,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final RRect rTrackRect = RRect.fromRectAndRadius(
      trackRect,
      const Radius.circular(10),
    );

    final Paint activePaint = Paint()..color = sliderTheme.activeTrackColor!;
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    final double activeWidth = thumbCenter.dx - trackRect.left;
    final RRect activeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        trackRect.left,
        trackRect.top,
        activeWidth,
        trackRect.height,
      ),
      const Radius.circular(10),
    );

    context.canvas.drawRRect(rTrackRect, inactivePaint);
    context.canvas.drawRRect(activeRect, activePaint);
  }
}
