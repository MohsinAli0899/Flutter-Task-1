import 'package:api_integration_python/Screens/home_page.dart';
import 'package:api_integration_python/Screens/login_page.dart';
import 'package:api_integration_python/utils/routes.dart';
import 'package:api_integration_python/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.loginRoute,
        routes: {
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
        });
  }
}
