import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    'welcome': ((context) => const WelcomeScreen()),
    'welcome/registration': ((context) => const RegistrationScreen()),
    'welcome/login': (context) {
      return const LoginScreen();
    },
    'account': (context) {
      return const AccountScreen();
    },
  };
  final String initialRoutes = 'welcome';
}
