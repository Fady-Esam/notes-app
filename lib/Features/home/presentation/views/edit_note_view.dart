import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/note_model.dart';
import '../manager/cubits/read_note_cubit/read_note_cubit.dart';
import 'widgets/color_list_editing.dart';
import 'widgets/custom_app_bar_container.dart';
import 'widgets/custom_app_bar_text.dart';
import 'widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? editedTitle;
  String? editedContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarText(title: 'Edit Note', fontSize: 34),
        actions: [
          CustomAppBarContainer(
            iconData: Icons.check,
            onpressed: () {
              widget.noteModel.title = editedTitle ?? widget.noteModel.title;
              widget.noteModel.content =
                  editedContent ?? widget.noteModel.content;
              widget.noteModel.save();
              GoRouter.of(context).pop();
              BlocProvider.of<ReadNoteCubit>(context).readNote();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            CustsomTextField(
              controller: TextEditingController(
                text: editedTitle ?? widget.noteModel.title,
              ),
              onChanged: (newValue) => editedTitle = newValue,
            ),
            const SizedBox(height: 16),
            CustsomTextField(
              controller: TextEditingController(
                text: editedContent ?? widget.noteModel.content,
              ),
              maxlines: 7,
              onChanged: (newValue) => editedContent = newValue,
            ),
            const SizedBox(height: 10),
            ColorListEditing(noteModel: widget.noteModel),
          ],
        ),
      ),
    );
  }
}
