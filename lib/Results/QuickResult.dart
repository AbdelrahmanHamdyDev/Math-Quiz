import 'package:flutter/material.dart';

class quickresult extends StatelessWidget {
  quickresult(this.MoreDetails, {super.key, required this.is_pass});

  void Function() MoreDetails;
  bool is_pass;
  @override
  Widget build(BuildContext context) {
    String imagePath = (is_pass == true)
        ? "Assets/Images/pass.jpg"
        : "Assets/Images/faild.jpg";
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: ScreenHeight / 7),
        Image.asset(
          imagePath,
          scale: (ScreenHeight / ScreenWidth),
        ),
        SizedBox(height: ScreenHeight / 40),
        OutlinedButton(
          onPressed: MoreDetails,
          child: const Text(
            "Show More Details",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: ScreenHeight / 7),
      ],
    );
  }
}
