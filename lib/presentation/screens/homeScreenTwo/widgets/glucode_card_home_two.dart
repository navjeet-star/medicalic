import 'package:healthapp/presentation/screens/homeScreenTwo/widgets/striped_bar_chart_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';


class GlucodeCardHomeTwo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.glucoseLevelTitle,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    AppStrings.viewDetails,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
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
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            AppStrings.glucoseValue,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5,
                              color: AppColors.textPrimary,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            AppStrings.glucoseUnit,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textHint,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Subtitle
                      const Text(
                        AppStrings.glucoseSubtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
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
