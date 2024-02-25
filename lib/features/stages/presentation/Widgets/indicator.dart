import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzaapp/core/Resources/color_manager.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_bloc.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_state.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/pageevent.dart';

class Indicator extends StatelessWidget {
  final int itemCount;
  final PageController pageController;

  const Indicator({required this.itemCount,required this.pageController, super.key});

  


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double screenDimensions = height> width ? height:width;
    return BlocConsumer<PageBloc, PageState>(
      listener: (context,state){
        pageController.jumpToPage(context.read<PageBloc>().state.index);
      },
      builder: (context, state) {
        return SizedBox(
          height: screenDimensions *0.02,
          width: screenDimensions * 0.3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return _createIndicatorElement(context, index, screenDimensions);
              }),
        );
      },
    );
  }

  Widget _createIndicatorElement(BuildContext context, int index, double screenDimensions) {
    double width = screenDimensions * 0.03;
    double height = screenDimensions * 0.02;
    Color color = Colors.grey;
    bool indexCheck = context.read<PageBloc>().state.index == index;
    if (indexCheck) {
      width = screenDimensions * 0.04;
      height = screenDimensions * 0.05;
      color = ColorManager.generateColor([Colors.orangeAccent, Colors.yellowAccent], opacity: 1);
    }
    return InkWell(
      onTap: (){
        if(!indexCheck){
          context.read<PageBloc>().add(PageChangedEvent(newIndex: index));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenDimensions*0.01),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(screenDimensions /2), color: color),
        width: width,
        height: height,
      ),
    );
  }
}
