import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/user_model.dart';
import '../../../core/constants/styles.dart';
import '../../../core/constants/constants.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/user-details', arguments: user.id),
      child: Card(
        elevation: 4,
        color: AppColors.cardColor,
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Row(
            children: [
              Hero(
                tag: 'user-avatar-${user.id}',
                child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 5.w,
                    backgroundImage: NetworkImage(user.avatar)),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${user.firstName} ${user.lastName}',
                        style: AppStyles.userCardTitleStyle),
                    SizedBox(height: 1.h),
                    Text(user.email, style: AppStyles.userCardSubtitleStyle),
                    SizedBox(height: 0.5.h),
                    Text('ID: ${user.id}', style: AppStyles.userCardIdStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
