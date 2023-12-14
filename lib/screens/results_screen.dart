import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz/components/questions_summary.dart';
import 'package:flutter_quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      final String correctAnswer = questions[i].answers[0];
      final String userAnswer = chosenAnswers[i];

      summary.add({
        'idx': i,
        'question': questions[i].text,
        'correct_answer': correctAnswer,
        'user_answer': userAnswer,
        'is_correct': userAnswer == correctAnswer
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final int correctAnswers =
        summaryData.where((e) => e["is_correct"] as bool).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summary: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestartQuiz,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                "Restart Quiz!",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
