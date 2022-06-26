import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_application/blocs/User/user_bloc.dart';
import 'dart:ui';

import '../blocs/autentification/autentification_bloc.dart';
import '../config/app_images.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenWidget(),
    );
  }
}

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueController = TextEditingController();
    final passwordController = TextEditingController();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bacgrountLogin),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const Image(
                  image: AssetImage(AppImages.imageLogin),
                  width: 250,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Вход',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          onChanget: null,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: false,
                          controller: valueController,
                          hintText: 'Email или телефон',
                          icon: const Icon(
                            Icons.mail,
                            color: Color(0xffffffff),
                          ),
                        ),
                        BlocBuilder<AutentificationBloc, AutentificationState>(
                          builder: (context, state) {
                            if (state is AutentificationError) {
                              return Text(
                                state.errorValue,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: const Color.fromARGB(
                                          255, 212, 12, 12),
                                    ),
                              );
                            }
                            return Container();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          onChanget: null,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: passwordController,
                          hintText: 'Пароль',
                          icon: const Icon(
                            Icons.key,
                            color: Color(0xffffffff),
                          ),
                        ),
                        BlocBuilder<AutentificationBloc, AutentificationState>(
                          builder: (context, state) {
                            if (state is AutentificationError) {
                              return Text(
                                state.errorPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: const Color.fromARGB(
                                          255, 212, 12, 12),
                                    ),
                              );
                            }
                            return Container();
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ButtonWidget(
                            bacgroundColor: Theme.of(context).primaryColor,
                            onTab: () {
                              BlocProvider.of<AutentificationBloc>(context)
                                  .add(GoAutf(
                                context: context,
                                password: passwordController.text,
                                value: valueController.text,
                              ));
                              BlocProvider.of<UserBloc>(context).add(GetUser());
                            },
                            textColor: const Color(0xffffffff),
                            title: 'Войти'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            NavWidget(
              buttonTitle: 'Зарегистрироваться',
              onTab: () {
                Navigator.of(context).pushNamed('welcome/registration');
              },
              textTitle: 'У вас еще нет аккаунта?',
            )
          ],
        ),
      ),
    );
  }
}
