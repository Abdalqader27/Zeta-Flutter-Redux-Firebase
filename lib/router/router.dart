import 'package:flutter/material.dart';
import 'package:zeta/src/presentation/auth/login/login_screen.dart';
import 'package:zeta/src/presentation/auth/register/register_screen.dart';

import '../src/presentation/home/settings/settings_screen.dart';

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.path:
      return _buildRoute(settings, const LoginScreen());
    case RegisterScreen.path:
      return _buildRoute(settings, const RegisterScreen());
    case SettingsScreen.path:
      return _buildRoute(settings, const SettingsScreen());
  }
  return _buildRoute(settings, const LoginScreen());
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}

get getRouter => _getRoute;
