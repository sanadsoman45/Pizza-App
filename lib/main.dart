import 'package:flutter/material.dart';
import 'package:pizzaapp/core/Routes/app_route_config.dart';
import 'package:pizzaapp/injection_pizza.dart' as packageDI;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  //will wait tilkl the below file has initialized all the required dependencies.
  await packageDI.init();

  setPathUrlStrategy();// to remove the # from route generated by gorouter.
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: MyAppRouter().router, //will implement and map the information obtained from info. parser.
  ));
}
