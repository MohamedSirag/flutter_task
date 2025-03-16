import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepository _repository;
  int _page = 1;
  bool _hasMore = true;

  UsersCubit(this._repository) : super(const UsersInitial());

  void fetchUsers() async {
    if (!_hasMore || state is UsersLoading) return;
    emit(_page == 1 ? const UsersLoading() : UsersLoadingMore(state.users));

    try {
      final response = await _repository.getUsers(_page);
      final newUsers =
          (response['data'] as List).map((e) => User.fromJson(e)).toList();
      final newUsersList = List<User>.from(state.users)..addAll(newUsers);

      _page++;
      _hasMore = response['page'] < response['total_pages'];

      emit(
          _hasMore ? UsersLoaded(newUsersList) : UsersNoMoreData(newUsersList));
    } catch (e) {
      emit(UsersError('Failed to load users', state.users));
    }
  }
}
