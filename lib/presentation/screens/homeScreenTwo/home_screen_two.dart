import 'package:healthapp/presentation/screens/homeScreenTwo/widgets/doctor_widget.dart';
import 'package:healthapp/presentation/screens/homeScreenTwo/widgets/glucode_card_home_two.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../widigits/category_chips_widget.dart';
import 'widgets/heart_rate_card_two_widget.dart';
import 'widgets/home_header_two_widget.dart';


class HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [



          Container(
            padding: EdgeInsets.only(
              top: topPadding > 0 ? topPadding + 12 : 50,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                HomeHeaderTwoWidget(),

                const SizedBox(height: 20),

                DoctorHeroWidget(),
              ],
            ),
          ),

          const SizedBox(height: 18),

          CategoryChipsWidget(
            onCategorySelected: (index) {
              // Category selection handled
            },
          ),

          const SizedBox(height: 16),


          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),

            decoration: BoxDecoration(
              color: AppColors.primaryContainer1,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFEEF1F6), width: 1.2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x06000000),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [HeartRateCardTwoWidget(), GlucodeCardHomeTwo()],
            ),
          ),



          const SizedBox(height: 110),
        ],
      ),
    );
  }

}
