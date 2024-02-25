import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StageThirdScreen extends StatelessWidget {
  const StageThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenDimension =
        screenHeight > screenWidth ? screenHeight : screenWidth;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/food.json',
                height: screenDimension * 0.25, width: screenDimension * 0.25),
            SizedBox(
              height: screenDimension * 0.09,
            ),
            Text(
              textAlign: TextAlign.center,
              "Tasty and Yummy",
              style: TextStyle(
                  fontSize: screenDimension * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenDimension*0.05),
              child: Text(
                textAlign: TextAlign.center,
                "Freshly prepared with the best recipe to give a sweet taste.",
                style: TextStyle(
                    fontSize: screenDimension * 0.02,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
