import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/styles.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: AppStyles.subtitleStyle,
          ),
          Expanded(
            child: Text(
              value,
              style: AppStyles.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}
