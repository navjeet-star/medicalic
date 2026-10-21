import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';


class DoctorCardWidget extends StatelessWidget {
  final VoidCallback? onDetailsDoctorTap;


  const DoctorCardWidget({
    super.key,
    this.onDetailsDoctorTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFEEF1F6),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ruby Melinda\nCharles',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 1.15,
                        letterSpacing: -0.5,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      AppStrings.doctorSpeciality,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.work_outline_rounded,
                            size: 12,
                            color: AppColors.textPrimary,
                          ),
                          const SizedBox(width: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            textBaseline: TextBaseline.alphabetic,
                            children: const [
                              Text(
                                AppStrings.experienceValue,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 35,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                AppStrings.experienceUnit,
                                style: TextStyle(
                                  color: AppColors.textHint,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Text(
                          AppStrings.experienceLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 14),

                  // Rating & Reviews Stat (Star + 4.7)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.star_border_rounded,
                            size: 12,
                            color: AppColors.textPrimary,
                          ),
                          SizedBox(width: 3),
                          Text(
                            AppStrings.ratingValue,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w400,
                              fontSize: 35,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Text(
                          '${AppStrings.reviewsCount} ${AppStrings.reviewsLabel}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onDetailsDoctorTap,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x331E6BFF),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            AppStrings.detailsDoctor,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Calendar Schedule Button (Black Circle)
              Material(
                color: Colors.transparent,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    color: AppColors.darkButton,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Info Button (White Circle with Border)
              Material(
                color: Colors.transparent,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE5E9F0),
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.alertIconColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
