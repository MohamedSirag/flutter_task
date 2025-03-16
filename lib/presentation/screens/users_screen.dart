import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../cubits/user/users_cubit.dart';
import '../widgets/common/error_widget.dart';
import '../widgets/common/loading_indicator.dart';
import '../widgets/common/no_more_widget.dart';
import '../widgets/user/user_card.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading || state is UsersInitial) {
            return Center(
              child: SizedBox(
                width: 5.w,
                height: 5.w,
                child: const CircularProgressIndicator(),
              ),
            );
          }

          List<dynamic> users = [];
          if (state is UsersLoaded) {
            users = state.users;
          } else if (state is UsersLoadingMore)
            users = state.users;
          else if (state is UsersNoMoreData)
            users = state.users;
          else if (state is UsersError) users = state.users;

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.8) {
                context.read<UsersCubit>().fetchUsers();
              }
              return false;
            },
            child: ListView.builder(
              itemExtent: 18.h,
              itemCount: users.length + 1,
              itemBuilder: (context, index) {
                if (index < users.length) return UserCard(user: users[index]);
                return _buildListFooter(state);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildListFooter(UsersState state) {
    if (state is UsersLoadingMore) return const LoadingIndicator();
    if (state is UsersNoMoreData) return const NoMoreItems();
    if (state is UsersError) return AppErrorWidget(message: state.message);
    return Container();
  }
}
