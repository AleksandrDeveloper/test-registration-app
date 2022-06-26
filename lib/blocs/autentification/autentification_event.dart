part of 'autentification_bloc.dart';

abstract class AutentificationEvent extends Equatable {
  const AutentificationEvent();

  @override
  List<Object> get props => [];
}

class GoAutf extends AutentificationEvent {
  final String value;
  final String password;
  final BuildContext context;
  const GoAutf({
    required this.context,
    required this.password,
    required this.value,
  });

  @override
  List<Object> get props => [
        password,
        context,
        value,
      ];
}
