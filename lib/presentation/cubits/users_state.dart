part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  final List<User> users;
  const UsersState(this.users);

  @override
  List<Object> get props => [users];
}

class UsersInitial extends UsersState {
  const UsersInitial() : super(const []);
}

class UsersLoading extends UsersState {
  const UsersLoading() : super(const []);
}

class UsersLoadingMore extends UsersState {
  const UsersLoadingMore(super.users);
}

class UsersLoaded extends UsersState {
  const UsersLoaded(super.users);
}

class UsersNoMoreData extends UsersState {
  const UsersNoMoreData(super.users);
}

class UsersError extends UsersState {
  final String message;
  const UsersError(this.message, super.users);

  @override
  List<Object> get props => [message, ...super.props];
}
