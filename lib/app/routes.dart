import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/admin_login_screen.dart';
import '../presentation/screens/customer_login_screen.dart';
import '../presentation/screens/customer_register_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/customer-login',
        builder: (context, state) => const CustomerLoginScreen(),
      ),
      GoRoute(
        path: '/customer-register',
        builder: (context, state) => const CustomerRegisterScreen(),
      ),
      GoRoute(
        path: '/admin-login',
        builder: (context, state) => const AdminLoginScreen(),
      ),
    ],
  );
}
