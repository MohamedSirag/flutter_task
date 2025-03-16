// lib/presentation/screens/user_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/user_model.dart';
import '../../data/models/support_model.dart';
import '../cubits/user_details/user_details_cubit.dart';
import '../widgets/common/loading_indicator.dart';
import '../widgets/common/error_widget.dart';
import '../../core/constants/styles.dart';
import '../widgets/user_details/user_details_content.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('User Details')),
      body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          if (state is UserDetailsLoading) return const LoadingIndicator();
          if (state is UserDetailsError)
            return AppErrorWidget(message: state.message);
          if (state is UserDetailsLoaded)
            return UserDetailsContent(user: state.user, support: state.support);
          return Container();
        },
      ),
    );
  }
}
