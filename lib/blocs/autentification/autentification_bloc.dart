import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'autentification_event.dart';
part 'autentification_state.dart';

class AutentificationBloc
    extends Bloc<AutentificationEvent, AutentificationState> {
  AutentificationBloc() : super(AutentificationLoading()) {
    String errorValue;
    String errorPassword;
    String email;
    String phoneNumber;
    on<GoAutf>((event, emit) async {
      final value = event.value;
      final password = event.password;

      if (value.isEmpty) {
        errorValue = 'Поле пустов, введите email или телефон';
        emit(AutentificationError(
          errorEmail: '',
          errorPassword: '',
          errorValue: errorValue,
          errorPhoneNumber: '',
        ));

        return;
      }

      //autf email
      if (value.isNotEmpty && RegExp(r"^[a-zA-Z]").hasMatch(value)) {
        email = value;
        if (email.isEmpty) {
          errorValue = 'Поле пустое, введите свой Email';
          emit(AutentificationError(
            errorEmail: '',
            errorPassword: '',
            errorValue: errorValue,
            errorPhoneNumber: '',
          ));

          return;
        }

        if (email.isNotEmpty &&
            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]").hasMatch(email)) {
          var userBox = await Hive.openBox<String>('userBox');
          final emailHive = userBox.get('email');
          if (email != emailHive) {
            errorValue = 'Такой email не зарегистрирован';
            emit(AutentificationError(
              errorEmail: '',
              errorPassword: '',
              errorValue: errorValue,
              errorPhoneNumber: '',
            ));
            return;
          }
          if (email == emailHive) {
            //password
            if (password.isEmpty) {
              errorPassword = 'Поле пустое, введите свой пароль';
              emit(AutentificationError(
                errorEmail: '',
                errorPassword: errorPassword,
                errorValue: '',
                errorPhoneNumber: '',
              ));

              return;
            }
            if (password.isNotEmpty &&
                RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(password)) {
              var userBox = await Hive.openBox<String>('userBox');
              final passwordHive = userBox.get('password');

              if (password != passwordHive) {
                errorPassword = 'Вы ввели неверный пароль';
                emit(AutentificationError(
                  errorEmail: '',
                  errorPassword: errorPassword,
                  errorValue: '',
                  errorPhoneNumber: '',
                ));
                return;
              }
              if (password == passwordHive) {
                Navigator.of(event.context).pushNamed('account');
              }

              userBox.close();
            } else {
              errorPassword =
                  'Пароль должен быть не короче 8 символов и содержит латиницу с цифрами';
              emit(AutentificationError(
                errorEmail: '',
                errorPassword: errorPassword,
                errorValue: '',
                errorPhoneNumber: '',
              ));

              return;
            }

            //password

          }
          userBox.close();
        } else {
          errorValue = 'Email введен не корректно';
          emit(AutentificationError(
            errorEmail: '',
            errorPassword: '',
            errorValue: errorValue,
            errorPhoneNumber: '',
          ));

          return;
        }
      }

      // autf phone
      if (value.isNotEmpty && RegExp(r"^[0-9]").hasMatch(value)) {
        phoneNumber = value;
        if (phoneNumber.isEmpty) {
          errorValue = 'Поле пустое, введите свой телефон';
          emit(AutentificationError(
            errorEmail: '',
            errorPassword: '',
            errorValue: errorValue,
            errorPhoneNumber: '',
          ));

          return;
        }
        if (phoneNumber.isNotEmpty &&
            RegExp(r"^[8||+7]+[0-9]{10}$").hasMatch(phoneNumber)) {
          var userBox = await Hive.openBox<String>('userBox');
          final phoneNumberHive = userBox.get('phoneNumber');
          if (phoneNumber != phoneNumberHive) {
            errorValue = 'Такой телефон не зарегистрирован';
            emit(AutentificationError(
              errorEmail: '',
              errorPassword: '',
              errorValue: errorValue,
              errorPhoneNumber: '',
            ));
            return;
          }
          if (phoneNumber == phoneNumberHive) {
            //password
            if (password.isEmpty) {
              errorPassword = 'Поле пустое, введите свой пароль';
              emit(AutentificationError(
                errorEmail: '',
                errorPassword: errorPassword,
                errorValue: '',
                errorPhoneNumber: '',
              ));

              return;
            }
            if (password.isNotEmpty &&
                RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(password)) {
              var userBox = await Hive.openBox<String>('userBox');
              final passwordHive = userBox.get('password');
              if (password != passwordHive) {
                errorPassword = 'Вы ввели неверный пароль';
                emit(AutentificationError(
                  errorEmail: '',
                  errorPassword: errorPassword,
                  errorValue: '',
                  errorPhoneNumber: '',
                ));
                return;
              }
              if (password == passwordHive) {
                Navigator.of(event.context).pushNamed('account');
              }

              userBox.close();
            } else {
              errorPassword =
                  'Пароль должен быть не короче 8 символов и содержит латиницу с цифрами';
              emit(AutentificationError(
                errorEmail: '',
                errorPassword: errorPassword,
                errorValue: '',
                errorPhoneNumber: '',
              ));

              return;
            }

            //password

          }
          userBox.close();
        } else {
          errorValue = 'Телефон должени начинаться с +7 или 8 и иметь 11 цифр';
          emit(AutentificationError(
            errorEmail: '',
            errorPassword: '',
            errorValue: errorValue,
            errorPhoneNumber: '',
          ));
          return;
        }
      }
    });
  }
}
