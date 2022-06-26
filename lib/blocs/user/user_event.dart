part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  @override
  List<Object> get props => [];
}

class ClearUser extends UserEvent {
  final BuildContext context;
  const ClearUser({required this.context});
  @override
  List<Object> get props => [context];
}
