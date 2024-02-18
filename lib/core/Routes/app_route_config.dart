//configuring the gorouter maps.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizzaapp/core/SharedScreens/error_page.dart';
import 'package:pizzaapp/features/Splash%20Screen/presentation/screens/splash_screen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
      routes: [
        //router array

        //defining go route path for home.
        GoRoute(
            name: 'home',
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SplashScreen());
            })
      ],
      
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child:
                ErrorPage()); // will invoke the error page when a error page needs to shown.
      },
      );
}
