part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationTrue extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationError extends RegistrationState {
  final String errorEmail;
  final String errorPassword;
  final String errorName;
  final String errorPhoneNumber;
  const RegistrationError(
      {required this.errorPassword,
      required this.errorEmail,
      required this.errorName,
      required this.errorPhoneNumber});
  @override
  List<Object> get props => [
        errorPassword,
        errorEmail,
        errorPhoneNumber,
        errorName,
      ];
}
