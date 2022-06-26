import 'dart:ui';
import 'package:flutter/material.dart';

import '../config/app_images.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreenWidget(),
    );
  }
}

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.bacgrountWelcome), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(AppImages.imageWelcome),
              width: MediaQuery.of(context).size.width - 150,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Добро пожаловать',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Для дальнейшей работы вам необходимо войти или зарегистрироваться',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color(0xff9ca0a3),
                          ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ButtonWidget(
                      title: 'Зарегистрироваться',
                      bacgroundColor: Theme.of(context).primaryColor,
                      textColor: const Color(0xffffffff),
                      onTab: () {
                        Navigator.of(context).pushNamed('welcome/registration');
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ButtonWidget(
                      title: 'Войти',
                      bacgroundColor: const Color(0xffffffff),
                      textColor: Theme.of(context).primaryColor,
                      onTab: () {
                        Navigator.of(context).pushNamed('welcome/login');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
