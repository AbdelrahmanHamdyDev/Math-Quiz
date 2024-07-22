import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  welcome({super.key, required this.startQuizFun});

  void Function() startQuizFun;

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "Assets/Images/MainLogo.jpg",
          scale: (ScreenHeight / ScreenWidth),
        ),
        Text(
          "Test Your Math Skills!",
          style: TextStyle(
            color: Colors.white,
            fontSize: (ScreenHeight / ScreenWidth) * 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: (ScreenHeight / 10)),
        OutlinedButton.icon(
          onPressed: startQuizFun,
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.blue,
          ),
          label: Text(
            "Start Quiz",
            style: TextStyle(
              color: Colors.white,
              fontSize: (ScreenHeight / ScreenWidth) * 10,
            ),
          ),
        ),
      ],
    );
  }
}
