//configuring the gorouter maps.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizzaapp/core/Routes/app_route_constants.dart';
import 'package:pizzaapp/core/SharedScreens/error_page.dart';
import 'package:pizzaapp/features/Auth/presentation/screens/auth_screen.dart';
import 'package:pizzaapp/features/Splash%20Screen/presentation/screens/splash_screen.dart';
import 'package:pizzaapp/features/stages/presentation/screens/stage_mainscreen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      //router array

      //defining go route path for home.
      GoRoute(
          name: AppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SplashScreen());
          }),
      GoRoute(
          path: '/stagemain',
          name: AppRouteConstants.stage1Name,
          pageBuilder: (context, state) {
            return const MaterialPage(child: StageMainScreen());
          }),
      GoRoute(
          name: AppRouteConstants.authRouteName,
          path: '/auth',
          pageBuilder: (context, state) {
            return const MaterialPage(child: AuthScreen());
          })
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child:
              ErrorPage()); // will invoke the error page when a error page needs to shown.
    },
  );
}
