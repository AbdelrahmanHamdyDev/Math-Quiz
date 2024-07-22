import 'package:flutter/material.dart';

class Answertemplete extends StatelessWidget {
  Answertemplete(
      {super.key, required this.answertext, required this.AddAnswer});

  String answertext;
  void Function(String Answer) AddAnswer;

  @override
  Widget build(context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        AddAnswer(answertext);
      },
      child: Text(
        answertext,
        style: TextStyle(
          fontSize: (ScreenHeight / ScreenWidth) * 8,
        ),
      ),
    );
  }
}
