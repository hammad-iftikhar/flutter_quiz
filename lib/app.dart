import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/screens/questions_screen.dart';
import 'package:flutter_quiz/screens/results_screen.dart';

// Internal imports
import 'package:flutter_quiz/screens/start_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Widget? activeScreen;

  List<String> selectedAnswers = [];
  QuestionsScreen? questionsScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    questionsScreen = QuestionsScreen(onSelectAnswer: onSelectAnswer);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = questionsScreen;
    });
  }

  void onSelectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
            chosenAnswers: selectedAnswers, onRestartQuiz: onRestartQuiz);
      });
    }
  }

  void onRestartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = questionsScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 2, 80),
                Color.fromARGB(255, 45, 7, 98),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
