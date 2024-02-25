import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzaapp/core/Resources/color_manager.dart';
import 'package:pizzaapp/features/stages/presentation/Widgets/indicator.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_bloc.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_state.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/pageevent.dart';
import 'package:pizzaapp/features/stages/presentation/screens/stages_screen1.dart';
import 'package:pizzaapp/features/stages/presentation/screens/stages_screen2.dart';
import 'package:pizzaapp/features/stages/presentation/screens/stages_screen3.dart';
import 'package:pizzaapp/injection_pizza.dart';

class StageMainScreen extends StatelessWidget {
  const StageMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double screenDimensions = height > width ? height : width;

    return Scaffold(
      body: BlocProvider(
        create: (_) => serviceLocator<PageBloc>(),
        child: getStack(screenDimensions),
      ),
    );
  }

  Widget getStack(double screenDimensions) {
    PageController _pageController = serviceLocator<PageController>();

    return BlocConsumer<PageBloc, PageState>(
      listener: (context, state) {
        _pageController.jumpToPage(context.read<PageBloc>().state.index);
        debugPrint("index is: ${context.read<PageBloc>().state.index}");
      },
      builder: (context, state) => Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              StageScreen(),
              StageSecondScreen(),
              StageThirdScreen(),
            ],
            onPageChanged: (index) {
              debugPrint("Index is: $index");
              context.read<PageBloc>().add(PageChangedEvent(newIndex: index));
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(screenDimensions * 0.02),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.generateColor(
                    [Colors.orangeAccent, Colors.yellowAccent],
                    opacity: 1.0,
                  ),
                ),
                onPressed: () => debugPrint("Skip"),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: (context.read<PageBloc>().state.index > 0),
                    child: IconButton(
                      onPressed: () {
                        context.read<PageBloc>().add(PrevPage(
                            curPageIndex:
                                context.read<PageBloc>().state.index));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Indicator(itemCount: 3,pageController: _pageController,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenDimensions * 0.02,
                        right: screenDimensions * 0.02,
                        bottom: screenDimensions * 0.02),
                    child: Visibility(
                      visible: (context.read<PageBloc>().state.index < 2),
                      replacement: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorManager.generateColor(
                            [Colors.orangeAccent, Colors.yellowAccent],
                            opacity: 1.0,
                          ),
                        ),
                        onPressed: () => debugPrint("Proceed"),
                        child: const Text(
                          "Proceed",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<PageBloc>().add(NextPage(
                              curPageIndex:
                                  context.read<PageBloc>().state.index));
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
