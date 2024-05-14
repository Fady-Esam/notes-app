
import 'package:flutter/material.dart';

class CustomAppBarText extends StatelessWidget {
  const CustomAppBarText({
    super.key, required this.title, required this.fontSize,
  });
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}

