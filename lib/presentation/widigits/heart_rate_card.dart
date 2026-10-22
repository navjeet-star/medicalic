import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_colors.dart';
import '../../core/app_strings.dart';
import '../screens/homeScreenTwo/widgets/striped_bar_chart_widget.dart';

class HeartRateCard extends StatelessWidget {
  final VoidCallback? onViewDetailsTap;
  final VoidCallback? onCardTap;

  const HeartRateCard({
    super.key,
    this.onViewDetailsTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer1,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFEEF1F6),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.heartRateTitle,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onViewDetailsTap,
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      AppStrings.viewDetails,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.heartRateValue,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                              letterSpacing: -0.8,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              AppStrings.heartRateUnit,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFA0A6B5),
                                letterSpacing: -0.2,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Subtitle
                      Text(
                        AppStrings.heartRateSubtitle,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          color: const Color(0xFF8C93A4),
                          height: 1.35,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Striped Bar Chart Widget
              const StripedBarChartWidget(
                chartHeight: 90,
                barWidth: 15,
                barSpacing: 6,
                bars: [
                  StripedBarData(heightRatio: 0.62, isStriped: true),
                  StripedBarData(heightRatio: 0.38, isStriped: true),
                  StripedBarData(heightRatio: 1.00, isStriped: true),
                  StripedBarData(heightRatio: 0.74, isStriped: true),
                  StripedBarData(heightRatio: 0.50, isStriped: false),
                  StripedBarData(heightRatio: 0.65, isStriped: false),
                  StripedBarData(heightRatio: 0.44, isStriped: false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
