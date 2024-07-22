import 'package:flutter/material.dart';
import 'package:newquiz/Questions/AnswerTemplete.dart';
import 'package:newquiz/Questions/Data/StoredData.dart';

class question extends StatefulWidget {
  question({super.key, required this.SaveAnswer});

  void Function(String answer) SaveAnswer;

  @override
  State<question> createState() {
    return _question();
  }
}

class _question extends State<question> {
  int currentQuestionNum = 0;

  void NextQuestion(String answer) {
    widget.SaveAnswer(answer);
    setState(() {
      currentQuestionNum++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionNum];
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all((ScreenHeight / ScreenWidth) * 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.Question,
            style: TextStyle(
              color: Colors.white,
              fontSize: (ScreenHeight / ScreenWidth) * 13,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenHeight / 20),
          ...currentQuestion.ShuffleAnswers.map((answer) {
            return Answertemplete(
              answertext: answer,
              AddAnswer: NextQuestion,
            );
          }),
        ],
      ),
    );
  }
}
