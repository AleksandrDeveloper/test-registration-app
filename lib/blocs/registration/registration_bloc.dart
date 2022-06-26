import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../modals/user_modal.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationLoading()) {
    User user;
    bool isAuth = false;
    String errorName;
    String errorPhoneNumber;
    String errorEmail;
    String errorPassword;
    on<GoRegistration>(
      (event, emit) async {
        emit(RegistrationLoading());

        final email = event.email;
        final phoneNumber = event.phoneNumber;
        final name = event.name;
        final password = event.password;

        //email

        if (email.isEmpty) {
          isAuth = false;
          errorEmail = 'Поле пустое, введите свой Email';
          emit(RegistrationError(
            errorEmail: errorEmail,
            errorPassword: '',
            errorName: '',
            errorPhoneNumber: '',
          ));

          return;
        }

        if (email.isNotEmpty &&
            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]").hasMatch(email)) {
          isAuth = true;
        } else {
          isAuth = false;
          errorEmail = 'Email введен не корректно';
          emit(RegistrationError(
            errorEmail: errorEmail,
            errorPassword: '',
            errorName: '',
            errorPhoneNumber: '',
          ));

          return;
        }

        //phone number

        if (phoneNumber.isEmpty) {
          isAuth = false;
          errorPhoneNumber = 'Поле пустое, введите свой телефон';
          emit(RegistrationError(
            errorEmail: '',
            errorPassword: '',
            errorName: '',
            errorPhoneNumber: errorPhoneNumber,
          ));

          return;
        }
        if (phoneNumber.isNotEmpty &&
            RegExp(r"^[8||+7]+[0-9]{10}$").hasMatch(phoneNumber)) {
          isAuth = true;
        } else {
          isAuth = false;
          errorPhoneNumber =
              'Телефон должени начинаться с +7 или 8 и иметь 11 цифр';
          emit(RegistrationError(
            errorEmail: '',
            errorPassword: '',
            errorName: '',
            errorPhoneNumber: errorPhoneNumber,
          ));
          return;
        }

        //name

        if (name.isEmpty) {
          isAuth = false;
          errorName = 'Поле пустое, введите свое имя';
          emit(RegistrationError(
            errorEmail: '',
            errorPassword: '',
            errorName: errorName,
            errorPhoneNumber: '',
          ));
          return;
        } else if (name.isNotEmpty) {
          isAuth = true;
        }

        //password

        if (password.isEmpty) {
          isAuth = false;
          errorPassword = 'Поле пустое, введите свой пароль';
          emit(RegistrationError(
            errorEmail: '',
            errorPassword: errorPassword,
            errorName: '',
            errorPhoneNumber: '',
          ));

          return;
        }
        if (password.isNotEmpty &&
            RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(password)) {
          isAuth = true;
        } else {
          isAuth = false;
          errorPassword =
              'Пароль должен быть не короче 8 символов и содержит латиницу с цифрами';
          emit(RegistrationError(
            errorEmail: '',
            errorPassword: errorPassword,
            errorName: '',
            errorPhoneNumber: '',
          ));

          return;
        }

        //valid true

        if (isAuth = true) {
          var userBox = await Hive.openBox<String>('userBox');
          await userBox.clear();
          await userBox.put('name', name);
          await userBox.put('password', password);
          await userBox.put('email', email);
          await userBox.put('phoneNumber', phoneNumber);
          userBox.close;
          emit(RegistrationTrue());
        }
        Navigator.of(event.context).pushNamed('account');
      },
    );
  }
}
