import 'package:flutter/material.dart';
import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';


class DoctorHeroWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -10,
            bottom: 0,
            top: 0,
            width: 200,
            child: Image.asset(
              AppAssets.doctorRubyy,
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              errorBuilder: (context, error, stackTrace) {
                return const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.person_rounded,
                    size: 140,
                    color: AppColors.softBlue,
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Reminders Badge Tag
                Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEEF1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFFFD6DD),
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lightbulb_outline_rounded,
                          size: 13,
                          color: Color(0xFFE84A5F),
                        ),
                        SizedBox(width: 4),
                        Text(
                          AppStrings.remindersTag,
                          style: TextStyle(
                            color: Color(0xFFE84A5F),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Text(
                  'Ruby\nMelinda\nCharles',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    height: 1.12,
                    color: AppColors.textPrimary,
                  ),
                ),

                // Specialty Subtitle
                const Text(
                  AppStrings.doctorSpeciality,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Location Row
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        AppStrings.doctorLocation,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    // Experience Stat
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          AppStrings.experienceYearsValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          AppStrings.experienceLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 24),

                    // Patients Stat
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          AppStrings.patientsCountValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          AppStrings.patientsLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
