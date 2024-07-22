import 'package:flutter/material.dart';
import 'package:newquiz/Questions/Data/StoredData.dart';
import 'package:flutter/services.dart';

import 'package:newquiz/WelcomeScreen.dart';
import 'package:newquiz/Questions/QuestionScreen.dart';
import 'package:newquiz/Results/ResultsScreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() {
    return _quiz();
  }
}

class _quiz extends State<quiz> {
  List<String> UserAnswer = [];
  String CurrentScreen = "Welcome_Screen";

  void StartQuiz() {
    HapticFeedback.mediumImpact();
    UserAnswer = [];
    setState(() {
      CurrentScreen = "Questions_screen";
    });
  }

  void SaveUserAnswer(answer) {
    HapticFeedback.lightImpact();
    UserAnswer.add(answer);
    if (UserAnswer.length == questions.length) {
      setState(() {
        CurrentScreen = "Result_Screen";
      });
    }
  }

  @override
  Widget build(context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    var ActiveScreen = (CurrentScreen == "Welcome_Screen")
        ? welcome(startQuizFun: StartQuiz)
        : (CurrentScreen == "Questions_screen")
            ? question(SaveAnswer: SaveUserAnswer)
            : results(UserAnswer, requiz: StartQuiz);

    return Stack(
      children: [
        Image.asset(
          "Assets/Images/science.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: ScreenWidth / 1.1,
            height: ScreenHeight / 1.4,
            alignment: Alignment.center,
            decoration:
                const BoxDecoration(color: Color.fromARGB(178, 0, 0, 0)),
            child: ActiveScreen,
          ),
        ),
      ],
    );
  }
}
