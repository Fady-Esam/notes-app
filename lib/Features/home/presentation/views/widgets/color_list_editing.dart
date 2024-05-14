import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/note_model.dart';
import 'color_item.dart';

class ColorListEditing extends StatefulWidget {
  const ColorListEditing({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<ColorListEditing> createState() => _ColorListEditingState();
}

class _ColorListEditingState extends State<ColorListEditing> {
  late int currentindex;
  @override
  void initState() {
    super.initState();
    currentindex = colors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentindex = index;
              widget.noteModel.color = colors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: colors[index],
              isSelected: currentindex == index,
            ),
          );
        },
      ),
    );
  }
}
