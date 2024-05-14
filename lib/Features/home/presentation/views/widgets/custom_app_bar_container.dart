

import 'package:flutter/material.dart';

class CustomAppBarContainer extends StatelessWidget {
  const CustomAppBarContainer({
    super.key, required this.iconData,required this.onpressed,
  });

  final IconData iconData;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.075),
      ),
      margin: const EdgeInsets.only(bottom: 10, right: 16),
      height: 80,
      width: 50,
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          iconData,
          size: 30,
        ),
      ),
    );
  }
}

