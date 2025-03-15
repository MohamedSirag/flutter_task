import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/styles.dart';

class NoMoreItems extends StatelessWidget {
  const NoMoreItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Center(
        child: Text('No more users to load', style: AppStyles.noMoreItemsStyle),
      ),
    );
  }
}
