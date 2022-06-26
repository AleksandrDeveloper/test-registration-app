import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_login_application/config/route_modal.dart';
import 'blocs/Registration/registration_bloc.dart';
import 'blocs/User/user_bloc.dart';
import 'blocs/autentification/autentification_bloc.dart';
import 'config/app_teme.dart';
import 'modals/user_modal.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(MultiBlocProvider(providers: [
    BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
    BlocProvider<AutentificationBloc>(
        create: (context) => AutentificationBloc()),
    BlocProvider<UserBloc>(create: (context) => UserBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test login application',
      theme: mainTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes().initialRoutes,
      routes: AppRoutes().routes,
    );
  }
}
