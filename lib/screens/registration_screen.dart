import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_application/config/app_images.dart';
import '../blocs/Registration/registration_bloc.dart';
import '../blocs/User/user_bloc.dart';
import '../widgets/widgets.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationScreenWidget(),
    );
  }
}

class RegistrationScreenWidget extends StatelessWidget {
  const RegistrationScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bacgrountRegistration),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  const Image(
                    image: AssetImage(AppImages.imageRegistration),
                    width: 170,
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
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: FormWidget(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NavWidget(
                    buttonTitle: 'Войти',
                    onTab: () =>
                        Navigator.of(context).pushNamed('welcome/login'),
                    textTitle: 'Уже есть аккаунт?',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Регистрация',
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
          textInputType: TextInputType.emailAddress,
          obscureText: false,
          controller: emailController,
          hintText: 'Email',
          icon: const Icon(
            Icons.mail,
            color: Color(0xffffffff),
          ),
        ),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationError) {
              return Text(
                state.errorEmail,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromARGB(255, 212, 12, 12),
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
          textInputType: TextInputType.phone,
          obscureText: false,
          controller: phoneNumberController,
          hintText: 'Телефон',
          icon: const Icon(
            Icons.phone,
            color: Color(0xffffffff),
          ),
        ),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationError) {
              return Text(
                state.errorPhoneNumber,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromARGB(255, 212, 12, 12),
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
          textInputType: TextInputType.name,
          obscureText: false,
          controller: nameController,
          hintText: 'Имя',
          icon: const Icon(
            Icons.person,
            color: Color(0xffffffff),
          ),
        ),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationError) {
              return Text(
                state.errorName,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromARGB(255, 212, 12, 12),
                    ),
              );
            }
            return Container();
          },
        ),
        const SizedBox(
          height: 15.0,
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
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationError) {
              return Text(
                state.errorPassword,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromARGB(255, 212, 12, 12),
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
              BlocProvider.of<RegistrationBloc>(context).add(
                GoRegistration(
                  context: context,
                  email: emailController.text,
                  name: nameController.text,
                  password: passwordController.text,
                  phoneNumber: phoneNumberController.text,
                ),
              );
            },
            textColor: const Color(0xffffffff),
            title: 'Зарегистрироваться'),
      ],
    );
  }
}
