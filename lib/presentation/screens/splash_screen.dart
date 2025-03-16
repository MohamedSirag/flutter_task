import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/splash/splash_cubit.dart';
import '../cubits/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startAnimation(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.isComplete) {
            Navigator.of(context).pushReplacementNamed('/users');
          }
        },
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.blue.shade900,
              body: Opacity(
                opacity: state.progress,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, size: 65, color: Colors.white),
                      SizedBox(height: 20),
                      Text(
                        'User Directory',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
