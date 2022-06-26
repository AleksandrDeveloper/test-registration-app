import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../modals/user_modal.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoading()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());

      try {
        final userBox = await Hive.openBox('userBox');
        final name = userBox.get('name');
        final email = userBox.get('email');
        final password = userBox.get('password');
        final phoneNumber = userBox.get('phoneNumber');
        emit(
          UserLoaded(
            user: User(
              email: email,
              name: name,
              password: password,
              phoneNumber: phoneNumber,
            ),
          ),
        );
      } catch (e) {
        emit(const UserError(errorMassege: 'Что то пошло не так'));
      }
      // on<ClearUser>((event, emit) async {
      //   final userBox = await Hive.openBox('userBox');
      //   userBox.clear();
      //   userBox.close();
      //   // Navigator.of(event.context).pushNamed('welcome');
      // });
    });
  }
}
