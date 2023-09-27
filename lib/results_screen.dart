import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.restartQuiz, {
    super.key,
    required this.selectedAnswers,
  });
  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final int numTotalQuestions = questions.length;
    final int numCorrectAnswers = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Answered $numCorrectAnswers/$numTotalQuestions correctly',
            style: GoogleFonts.notoSansOldPermic(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(summaryData),
          TextButton.icon(
            icon: const Icon(Icons.restart_alt),
            onPressed: restartQuiz,
            label: const Text(
              'Restart',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}
