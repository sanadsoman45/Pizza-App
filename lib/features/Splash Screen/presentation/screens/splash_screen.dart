import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pizzaapp/core/Routes/app_route_constants.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("inside splash screen");
    return Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
        //available height and width for the child widget  to occupy on the screen.
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;

        //calculating font size and lottie image height and width for diff. screens
        double headingFontSize = width / 10;
        double subheadingFontSize = width / 21;
        double animationWidth = width / 3;
        double animationHeight = height / 4;


        debugPrint("Start");
        // to navigate to new screen post 1 mins (function to create delayed effect)
        Future.delayed(
            const Duration(seconds: 10), () => context.pushNamed(AppRouteConstants.stage1Name));

        debugPrint("End");

        return Center(
          child: SizedBox(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animations/pizzerialogo.json",
                      width: animationWidth, height: animationHeight),
                  Text(
                    'Pizzeria',
                    style: TextStyle(
                        fontSize: headingFontSize, fontWeight: FontWeight.bold),
                  ),
                  Text('Where Happiness Is Served',
                      style: TextStyle(
                          fontSize: subheadingFontSize,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        );
      })),
    );

    
  }
}
