import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              // bool tf = data['user_answer'] == data['correct_answer'];
              Color c = data['user_answer'] == data['correct_answer']
                  ? Colors.amber
                  : Colors.red;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: c, borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'] as String,
                              style: GoogleFonts.lato(
                                //color: c,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.lato(
                              color: c,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: GoogleFonts.lato(
                                //color: c,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
