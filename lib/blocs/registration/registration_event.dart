part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class GoRegistration extends RegistrationEvent {
  final BuildContext context;
  final String phoneNumber;
  final String name;
  final String email;
  final String password;
  const GoRegistration({
    required this.context,
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        email,
        name,
        password,
        phoneNumber,
      ];
}
