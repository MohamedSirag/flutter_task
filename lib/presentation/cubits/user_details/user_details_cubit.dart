import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';
import '../../../data/models/support_model.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserRepository _repository;
  UserDetailsCubit(this._repository) : super(UserDetailsInitial());

  void fetchUserDetails(int userId) async {
    emit(UserDetailsLoading());
    try {
      final response = await _repository.getUserDetails(userId);
      emit(UserDetailsLoaded(
        User.fromJson(response['data']),
        Support.fromJson(response['support']),
      ));
    } catch (e) {
      emit(const UserDetailsError('Failed to load user details'));
    }
  }
}
