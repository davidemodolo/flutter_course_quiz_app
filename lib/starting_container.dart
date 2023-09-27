import 'package:flutter/material.dart';

class StartingContainer extends StatelessWidget {
  const StartingContainer(this.startQuiz, {super.key});
  static const String imgPath = 'assets/images/quiz-logo.png';
  static const String title = 'Learn Flutter the fun way!';
  static const String btnText = 'Start Quiz';

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imgPath,
          width: 300,
          color: const Color.fromARGB(155, 255, 255, 255),
        ),
        const SizedBox(
          // non bellissimo
          height: 20,
        ),
        const Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        const SizedBox(
          // non bellissimo
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right),
          label: const Text(
            btnText,
          ),
        ),
      ],
    );
  }
}
