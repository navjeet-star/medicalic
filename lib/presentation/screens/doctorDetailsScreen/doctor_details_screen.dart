import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../homeScreen/widgets/doctor_card_widget.dart';
import '../../widigits/glucose_card_widget.dart';
import 'widgets/details_header_widget.dart';
import 'widgets/interactive_schedule_calendar_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
   DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        physics:  BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          // Top Header Container
          Padding(
            padding: EdgeInsets.only(
              top: topPadding > 0 ? topPadding + 10 : 48,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: DetailsHeaderWidget(
              onBackTap: () => Navigator.of(context).pop(),
            ),
          ),

          // Doctor Information Card
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: DoctorCardWidget(

            ),
          ),

           SizedBox(height: 24),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: InteractiveScheduleCalendarWidget(

            ),
          ),

           SizedBox(height: 24),

          // Doctor Reminders Section
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.doctorRemindersTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:  Color(0xFFFFEEF1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:  Color(0xFFFFD6DD),
                            width: 1,
                          ),
                        ),
                        child:  Row(
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
                  ],
                ),

                 SizedBox(height: 8),

                // Description text
                 Text(
                  AppStrings.doctorRemindersSubtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

           SizedBox(height: 20),

          // Heart Rate Status Card with Dark Checkups Button
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildDetailsHeartRateCard(context),
          ),

           SizedBox(height: 16),

          // Glucose Level Card with Striped Bar Chart
          GlucoseCardWidget(
          ),

          // Bottom Spacing
           SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildDetailsHeartRateCard(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer1,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color:  Color(0xFFEEF1F6),
          width: 1.2,
        ),
        boxShadow:  [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Heart Rate info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:  [
              Text(
                AppStrings.heartRateTitle,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 3),
              Text(
                AppStrings.careForHealth,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          // Right: Dark Checkups button + 56% + Calendar
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dark Checkups Pill Button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkButton,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow:  [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.all_inclusive_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          AppStrings.checkupsButton,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

               SizedBox(width: 8),

              Container(
                padding:  EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color:  Color(0xFFE5E9F0),
                    width: 1.2,
                  ),
                ),
                alignment: Alignment.center,
                child:  Text(
                  AppStrings.checkupsPercentage,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

               SizedBox(width: 8),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:  Color(0xFFE5E9F0),
                        width: 1.2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child:  Icon(
                      Icons.calendar_month_outlined,
                      size: 18,
                      color: AppColors.textPrimary,
                    ),
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
