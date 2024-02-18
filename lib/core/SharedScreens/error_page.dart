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
          debugPrint("inside error page");
          //available height and width for the child widget  to occupy on the screen.
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;

          //calculating font size and lottie image height and width for diff. screens
          double fontSize = width / 40; // Adjust as needed
          double animationWidth = width / 3; // Adjust as needed
          double animationHeight = animationWidth * 0.20;

          debugPrint("animation width is:$animationWidth. animation height is:$animationHeight. font size is: $fontSize");

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
                      width: animationWidth, height: animationWidth),
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
