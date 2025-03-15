import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/user_model.dart';
import '../../../data/models/support_model.dart';
import '../../../core/constants/styles.dart';
import 'detail_row.dart';

class UserDetailsContent extends StatelessWidget {
  final User user;
  final Support support;

  const UserDetailsContent({
    required this.user,
    required this.support,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 10.w,
            backgroundImage: NetworkImage(user.avatar),
          ),
          SizedBox(height: 3.h),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  DetailRow(label: 'ID', value: user.id.toString()),
                  Divider(height: 2.h),
                  DetailRow(label: 'First Name', value: user.firstName),
                  Divider(height: 2.h),
                  DetailRow(label: 'Last Name', value: user.lastName),
                  Divider(height: 2.h),
                  DetailRow(label: 'Email', value: user.email),
                ],
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    'Support Information',
                    style: AppStyles.subtitleStyle,
                  ),
                  SizedBox(height: 2.h),
                  DetailRow(label: 'URL', value: support.url),
                  Divider(height: 2.h),
                  DetailRow(label: 'Text', value: support.text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
