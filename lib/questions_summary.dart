import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: summaryData.map((data) {
            final questionIdx = data['question-idx'] as int;
            final userAns = data['user-ans'].toString();
            final correctAns = data['correct-ans'].toString();

            final isCorrect = userAns == correctAns;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (questionIdx + 1).toString(),
                    style: GoogleFonts.aBeeZee(
                      decorationStyle: TextDecorationStyle.wavy,
                      color: isCorrect ? Colors.green : const Color.fromARGB(255, 246, 34, 19),
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"].toString(),
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Your Answer: $userAns",
                          style: GoogleFonts.abel(
                            color: const Color.fromARGB(255, 106, 227, 150),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Correct Answer: $correctAns",
                          style: GoogleFonts.abel(
                            color: const Color.fromARGB(255, 25, 172, 209),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
