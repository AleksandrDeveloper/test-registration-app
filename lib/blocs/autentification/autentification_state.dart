part of 'autentification_bloc.dart';

abstract class AutentificationState extends Equatable {
  const AutentificationState();

  @override
  List<Object> get props => [];
}

class AutentificationLoading extends AutentificationState {
  @override
  List<Object> get props => [];
}

class AutentificationError extends AutentificationState {
  final String errorEmail;
  final String errorPassword;
  final String errorValue;
  final String errorPhoneNumber;
  const AutentificationError(
      {required this.errorPassword,
      required this.errorEmail,
      required this.errorValue,
      required this.errorPhoneNumber});
  @override
  List<Object> get props => [
        errorPassword,
        errorEmail,
        errorPhoneNumber,
        errorValue,
      ];
}

class AutentificationTrue extends AutentificationState {
  @override
  List<Object> get props => [];
}
