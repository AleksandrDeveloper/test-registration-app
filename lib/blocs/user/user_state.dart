part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;
  const UserLoaded({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  final String errorMassege;
  const UserError({required this.errorMassege});
  @override
  List<Object> get props => [errorMassege];
}
