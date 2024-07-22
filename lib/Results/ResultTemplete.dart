import 'package:flutter/material.dart';

class ResultTemplete extends StatelessWidget {
  ResultTemplete(this.Summarydata, {super.key});

  List<Map<String, Object>> Summarydata;

  @override
  Widget build(context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: ScreenHeight / 2,
      child: SingleChildScrollView(
        child: Column(
          children: Summarydata.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all((ScreenHeight / ScreenWidth) * 5),
                    decoration: BoxDecoration(
                      color: (data["is_correct"] == true)
                          ? Colors.blue
                          : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child:
                        Text(((data["Question_Index"] as int) + 1).toString()),
                  ),
                  SizedBox(width: ScreenWidth / 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["Question"].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "your Answer: " + data["User_Answer"].toString(),
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "the Answer: " + data["Correct_Answer"].toString(),
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: ScreenHeight / 100),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
