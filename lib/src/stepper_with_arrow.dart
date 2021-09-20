import 'package:flutter/material.dart';

import '../arrow_stepper.dart';
import 'arrow_step.dart';

typedef Widget ProgressStepperBuilder(int index);
typedef void ProgressStepperOnClick(int index);

class ArrowWithStepper extends StatelessWidget {
  final Color progressColor;
  final Color color;
  final double width;
  final double height;
  final double padding;
  final int stepCount;
  final int currentStep;
  final ScrollController? stepScrollController;
  final ProgressStepperBuilder? builder;
  final ProgressStepperOnClick? onClick;

  const ArrowWithStepper({
    required this.width,
    this.stepScrollController,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
    this.builder,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    controller: stepScrollController,
    scrollDirection: Axis.horizontal,
    child: Container(
      height: height,
      child: Row(
        children: _getProgressSteps(),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    ),
  );

  List<Widget> _getProgressSteps() {
    if (builder == null) {
      return _createSteps();
    } else {
      return _invokeBuilder();
    }
  }

  List<Widget> _createSteps() {
    List<Widget> steps = [];
    double widthOfStep = (width - ((stepCount - 1) * padding)) / stepCount;
    for (int index = 1; index <= stepCount; index++) {
      ProgressStepWithArrow step = ProgressStepWithArrow(
        width: widthOfStep,
        defaultColor: Colors.red,
        progressColor: Colors.green,
        wasCompleted: false,
        child: Center(
          child: Text(
            index.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      if (onClick != null) {
        steps.add(
          GestureDetector(
            child: step,
            onTap: () {
              onClick!(index);
            },
          ),
        );
      } else {
        steps.add(step);
      }
    }
    return steps;
  }

  List<Widget> _invokeBuilder() {
    List<Widget> steps = [];
    for (int index = 1; index <= stepCount; index++) {
      steps.add(builder!(index));
    }
    return steps;
  }
}
