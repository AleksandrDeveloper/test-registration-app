import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_application/blocs/User/user_bloc.dart';

import '../config/app_images.dart';
import '../widgets/button_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(GetUser());
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoaded) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.bacgrountAccount),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: const Image(
                              image: AssetImage(AppImages.noAvatar),
                              width: 120,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          state.user.name,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: const Color(0xffffffff),
                                  ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(state.user.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: const Color(0xff858c95)))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: FadeInUp(
                    child: Container(
                      alignment: Alignment.center,
                      height: 480,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xff000216),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Добро пожаловать ${state.user.name}, тут будет храниться ваши данные',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: const Color(0xffffffff),
                                  ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            PersonalData(
                              name: state.user.name,
                              password: state.user.password,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ContactData(
                              email: state.user.email,
                              phoneNumber: state.user.phoneNumber,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ButtonWidget(
                              title: 'Удалить аккаунт',
                              bacgroundColor: const Color(0xffc53929),
                              textColor: const Color(0xffffffff),
                              onTab: () {
                                BlocProvider.of<UserBloc>(context)
                                    .add(ClearUser(context: context));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class PersonalData extends StatelessWidget {
  final String name;
  final String password;
  const PersonalData({
    required this.name,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Личная информация',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: const Color(0xff858c95),
              ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Имя',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Пароль',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
            Text(
              password,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class ContactData extends StatelessWidget {
  final String email;
  final String phoneNumber;
  const ContactData({
    required this.email,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Контактная информация',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: const Color(0xff858c95),
              ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Почта',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Телефон',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
            Text(
              phoneNumber,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
