import 'package:flutter/material.dart';
import 'package:newquiz/Questions/Data/StoredData.dart';
import 'package:flutter/services.dart';

import 'package:newquiz/Results/ResultTemplete.dart';
import 'package:newquiz/Results/QuickResult.dart';

class results extends StatefulWidget {
  results(this.UserAnswers, {super.key, required this.requiz});

  List<String> UserAnswers;
  void Function() requiz;

  @override
  State<results> createState() {
    return _results();
  }
}

class _results extends State<results> {
  String CurrentResultState = "quick_Image";

  void MoreDetails() {
    HapticFeedback.mediumImpact();
    setState(() {
      CurrentResultState = "more_Details";
    });
  }

  List<Map<String, Object>> get Summarydata {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add({
        "Question_Index": i,
        "Question": questions[i].Question,
        "User_Answer": widget.UserAnswers[i],
        "Correct_Answer": questions[i].answers[0],
        "is_correct": widget.UserAnswers[i] == questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    int totalAnswers = Summarydata.length;
    int correctAnswers =
        Summarydata.where((data) => data["is_correct"] as bool).length;

    var currentView = (CurrentResultState == "quick_Image")
        ? quickresult(MoreDetails,
            is_pass: (correctAnswers >= totalAnswers / 2))
        : ResultTemplete(Summarydata);

    return Container(
      margin: EdgeInsets.all((ScreenHeight / ScreenWidth) * 5),
      child: Column(
        children: [
          SizedBox(height: ScreenHeight / 30),
          Text(
            "You Answer $correctAnswers Questions Correctly out of $totalAnswers Questions",
            style: TextStyle(
              color: Colors.white,
              fontSize: (ScreenHeight / ScreenWidth) * 13,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenHeight / 40),
          currentView,
          SizedBox(height: ScreenHeight / 40),
          ElevatedButton.icon(
            onPressed: widget.requiz,
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.purple,
            ),
            label: const Text(
              "Restart Quiz?",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
