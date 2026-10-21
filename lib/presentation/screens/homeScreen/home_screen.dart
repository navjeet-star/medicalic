import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../widigits/category_chips_widget.dart';
import '../../widigits/heart_rate_card.dart';
import '../doctorDetailsScreen/doctor_details_screen.dart';
import '../../widigits/glucose_card_widget.dart';
import 'widgets/doctor_card_widget.dart';
import 'widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const HomeHeaderWidget(),
          ),


          SizedBox(height: 10),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child:  CategoryChipsWidget(
              onCategorySelected: (index) {
              },
            ),
          ),

          SizedBox(height: 10),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer1,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: DoctorCardWidget(
              onDetailsDoctorTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  DoctorDetailsScreen(),
                  ),
                );
              },

            ),
          ),

          SizedBox(height: 16),

          GlucoseCardWidget(

          ),

          SizedBox(height: 16),

          HeartRateCard(),

          SizedBox(height: 16),

          GlucoseCardWidget(),

          SizedBox(height: 100),
        ],
      ),
    );
  }


}
