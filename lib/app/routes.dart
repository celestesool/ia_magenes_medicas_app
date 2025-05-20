import 'package:flutter/material.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/auth/views/register_page.dart';
import '../modules/dashboard/dashboard_page.dart';
import '../modules/auth/views/splash_screen.dart';
final Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const SplashScreen(),
  '/login': (_) => const LoginPage(),
  '/register': (_) => const RegisterPage(),
  '/dashboard': (_) => const DashboardPage(),
};
