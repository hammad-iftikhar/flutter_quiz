import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((e) => SummaryItem(e)).toList(),
        ),
      ),
    );
  }
}
