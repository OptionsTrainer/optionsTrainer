import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paper_trading/features/home/screens/my_home_page.dart';
import 'package:paper_trading/features/login/screens/forget_password_screen.dart';
import 'package:paper_trading/features/login/screens/login_screen.dart';
import 'package:paper_trading/features/login/screens/sign_up_screen.dart';
import 'package:paper_trading/routes/routes_name.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    //login initial route
    GoRoute(
      path: '/',
      name: RoutesName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),

    //forget password
    GoRoute(
      path: '/sign-up',
      name: RoutesName.signUp,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),

    //sign-up
    GoRoute(
      path: '/forget-password',
      name: RoutesName.forgetPassword,
      builder: (BuildContext context, GoRouterState state) {
        return const ForgetPasswordScreen();
      },
    ),

    //home page
    GoRoute(
      path: '/home',
      name: RoutesName.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
  ],
);
