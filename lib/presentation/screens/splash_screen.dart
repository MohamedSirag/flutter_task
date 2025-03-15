import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../../core/constants/styles.dart';
import '../../core/constants/constants.dart';
import 'users_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 6.5.h, color: Colors.white),
          SizedBox(height: 2.h),
          Text('User Directory', style: AppStyles.titleStyle),
        ],
      ),
      nextScreen: UsersScreen(),
      splashTransition: SplashTransition.fadeTransition,
      duration: Duration(seconds: 3).inMilliseconds,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
