import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pizzaapp/core/Routes/app_route_config.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_bloc.dart';

///file for maintaining & declaring the dependency injections in the app.

final serviceLocator = GetIt.instance;

Future<void> init() async {

  //the below instances will be created only once and it will be when they are invoked for the first time.

  // go router delegate instance 
  serviceLocator.registerLazySingleton<GoRouterDelegate>(() => MyAppRouter().router.routerDelegate);

  //go routeinformationparser
  serviceLocator.registerLazySingleton<GoRouteInformationParser>(() => MyAppRouter().router.routeInformationParser);
  serviceLocator.registerLazySingleton<GoRouteInformationProvider>(() => MyAppRouter().router.routeInformationProvider);

  serviceLocator.registerFactory<PageBloc>(() => PageBloc());// depenbdency injection of pagebloc.
  serviceLocator.registerFactory<PageController>(() => PageController());
}
