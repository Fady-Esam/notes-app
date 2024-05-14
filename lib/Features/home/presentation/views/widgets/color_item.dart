import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: isSelected
          ? CircleAvatar(
              radius: 43,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 39,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 39,
              backgroundColor: color,
            ),
    );
  }
}
