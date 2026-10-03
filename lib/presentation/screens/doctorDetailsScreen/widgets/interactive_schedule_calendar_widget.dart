import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class InteractiveScheduleCalendarWidget extends StatefulWidget {


  @override
  State<InteractiveScheduleCalendarWidget> createState() =>
      _InteractiveScheduleCalendarWidgetState();
}

class _InteractiveScheduleCalendarWidgetState
    extends State<InteractiveScheduleCalendarWidget> {
  int _selectedDate = 20;

  final Set<int> _availableDates = {10, 11, 12, 13, 14, 16, 17, 18, 19, 20};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    AppStrings.seamlessTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    AppStrings.seamlessSubtitle,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: Text(
                AppStrings.available,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Calendar Grid Representation
        _buildCustomCalendarGrid(),
      ],
    );
  }

  Widget _buildCustomCalendarGrid() {
    // 5 Rows of 7 days
    final rows = [
      [1, 2, 3, 4, 5, 6, 7],
      [9, 10, 11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20, 21, 22],
      [23, 24, 25, 26, 27, 28, 29],
      [30, 31, null, null, null, null, null],
    ];

    return Column(
      children: rows.map((week) => _buildWeekRow(week)).toList(),
    );
  }

  Widget _buildWeekRow(List<int?> week) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: week.map((day) {
          if (day == null) {
            return const Expanded(
              child: SizedBox(height: 40),
            );
          }

          final isSelected = day == _selectedDate;
          final isAvailable = _availableDates.contains(day);

          bool isPillStart = (day == 10 || day == 16);
          bool isPillEnd = (day == 14 || day == 19);
          bool isPillMiddle = isAvailable && !isSelected;

          Color textColor;
          if (isSelected) {
            textColor = Colors.white;
          } else if (isAvailable) {
            textColor = AppColors.primary;
          } else {
            textColor = const Color(0xFF8E95A5);
          }

          return Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : (isPillMiddle
                        ? const Color(0xFFF0F5FE)
                        : Colors.transparent),
                shape: isSelected ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: isSelected
                    ? null
                    : (isPillMiddle
                        ? BorderRadius.horizontal(
                            left: isPillStart
                                ? const Radius.circular(20)
                                : Radius.zero,
                            right: isPillEnd
                                ? const Radius.circular(20)
                                : Radius.zero,
                          )
                        : BorderRadius.circular(20)),
                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color: Color(0x331E6BFF),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : (isAvailable ? FontWeight.w600 : FontWeight.w400),
                  color: textColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
