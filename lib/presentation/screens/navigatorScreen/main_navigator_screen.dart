import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../widigits/custom_bottom_nav_bar.dart';
import '../homeScreen/home_screen.dart';
import '../homeScreenTwo/home_screen_two.dart';
import '../msgScreen/message_screen.dart';
import '../profileScreen/profile_screeen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreenTwo(),
    MessageScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Current Active Screen
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
