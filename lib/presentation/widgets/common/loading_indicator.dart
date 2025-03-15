import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: SizedBox(
          width: 5.w,
          height: 5.w,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
