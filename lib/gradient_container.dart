import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/starting_container.dart';
import 'package:adv_basics/results_screen.dart';

const Alignment staAlignment = Alignment.topLeft;
const Alignment endAlignment = Alignment.bottomRight;
// Alignment? endAlignment -> typeof Alignment or Null;
// final var -> const after executing, const var -> const at compile time

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() {
    return _GradientContainerState();
  }
}

class _GradientContainerState extends State<GradientContainer> {
  final Color color1 = Colors.green;
  final Color color2 = Colors.deepPurple;
  final List<String> selectedAnswers = [];
  int activeScreen = 1;

  void switchScreen() {
    setState(() {
      activeScreen = 2;
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 3;
        //selectedAnswers.clear();
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 1;
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartingContainer(switchScreen);
    switch (activeScreen) {
      case 2:
        screenWidget = QuestionsScreen(chosenAnswer);
        break;
      case 3:
        screenWidget =
            ResultsScreen(restartQuiz, selectedAnswers: selectedAnswers);
        break;
      default:
        screenWidget = StartingContainer(switchScreen);
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: staAlignment,
          end: endAlignment,
        ),
      ),
      //child: const Center(child: StyleText(outputText: 'Hello World!')),
      child: Center(child: screenWidget),
    );
  }
}
