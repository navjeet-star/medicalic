import 'package:flutter/material.dart';
import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';


class HomeHeaderTwoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Brand Logo & Tagline on Left
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
                children: [
                  TextSpan(
                    text: 'Medic',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'alic',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              AppStrings.appTagline,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        // Action Icons on Right (Search, Notification, Avatar)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search Button
            _buildCircularButton(
              child: const Icon(
                Icons.search_rounded,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),

            const SizedBox(width: 8),

            _buildCircularButton(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.textPrimary,
                    size: 20,
                  ),
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF3B30),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            GestureDetector(
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                  border: Border.all(
                    color: const Color(0xFFE5E9F0),
                    width: 1.2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(2.5),
                child: ClipOval(
                  child: Image.asset(
                    AppAssets.doctorAvatar,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.person_rounded,
                        color: AppColors.primary,
                        size: 22,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularButton({
    required Widget child,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFE5E9F0),
              width: 1.2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
