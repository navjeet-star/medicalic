import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_strings.dart';

class _CategoryItem {
  final String title;
  final IconData icon;

  const _CategoryItem({
    required this.title,
    required this.icon,
  });
}


class CategoryChipsWidget extends StatefulWidget {
  final ValueChanged<int>? onCategorySelected;

  const CategoryChipsWidget({
    super.key,
    this.onCategorySelected,
  });

  @override
  State<CategoryChipsWidget> createState() => _CategoryChipsWidgetState();
}

class _CategoryChipsWidgetState extends State<CategoryChipsWidget> {
  int _selectedIndex = 0;

  final List<_CategoryItem> _categories = const [
    _CategoryItem(
      title: AppStrings.categoryDoctors,
      icon: Icons.person_pin_circle_outlined,
    ),
    _CategoryItem(
      title: AppStrings.categoryTherm,
      icon: Icons.thermostat_outlined,
    ),
    _CategoryItem(
      title: AppStrings.categoryEHR,
      icon: Icons.assignment_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_categories.length, (index) {
          final category = _categories[index];
          final isSelected = _selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onCategorySelected?.call(index);
                },
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  padding: const EdgeInsets.fromLTRB(18, 6, 8, 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFD6E4FF)
                          : const Color(0xFFEEF1F6),
                      width: 1.2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x06000000),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Action Icon Circle
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFFEEF3FC),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          category.icon,
                          size: 20,
                          color: isSelected
                              ? Colors.white
                              : AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
