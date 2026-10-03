import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16,
        0,
        16,
        20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.border,
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.navBarShadow,
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: AppStrings.navHome,
            isSelected: currentIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          _NavItem(
            icon: Icons.calendar_today_outlined,
            label: AppStrings.navSchedule,
            isSelected: currentIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          _NavItem(
            icon: Icons.mail_outline_rounded,
            label: AppStrings.navMessage,
            isSelected: currentIndex == 2,
            onTap: () => onItemSelected(2),
          ),
          _NavItem(
            icon: Icons.person_outline_rounded,
            label: AppStrings.navProfile,
            isSelected: currentIndex == 3,
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? AppColors.primary
        : AppColors.textMuted;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(4),
              child: Icon(
                icon,
                size: 24,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}