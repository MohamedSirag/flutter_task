part of 'user_details_cubit.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final User user;
  final Support support;
  const UserDetailsLoaded(this.user, this.support);

  @override
  List<Object> get props => [user, support];
}

class UserDetailsError extends UserDetailsState {
  final String message;
  const UserDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
