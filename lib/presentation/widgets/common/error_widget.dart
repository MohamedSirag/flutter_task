import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../cubits/user/users_cubit.dart';
import '../../../core/constants/styles.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: AppStyles.errorStyle),
          SizedBox(height: 2.h),
          ElevatedButton(
            onPressed: () => context.read<UsersCubit>().fetchUsers(),
            child: Text('Retry', style: TextStyle(fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }
}
