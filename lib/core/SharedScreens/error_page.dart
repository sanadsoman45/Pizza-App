import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    //retrun a scaffold enclosing a container occupying the mnax available height and width.
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //available height and width for the child widget  to occupy on the screen.
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;

          //calculating font size and lottie image height and width for diff. screens
          double fontSize = width / 40; 
          double animationWidth = width / 3; 
          double animationHeight = animationWidth * 0.99;

          //returning sized box wrapping a column of lottie image and text.
          return Center(
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animations/errorimage.json",
                      width: animationWidth, height: animationHeight),
                  Text(
                    "Page Not Found",
                    style: TextStyle(fontSize: fontSize),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
