import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

class SvinnsmartApp extends StatelessWidget {
  const SvinnsmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Svinnsmart',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
