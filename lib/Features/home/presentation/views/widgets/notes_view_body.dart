import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../manager/cubits/read_note_cubit/read_note_cubit.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody(
      {super.key, required this.isSearchActive, this.searchedNotes});
  final bool isSearchActive;
  final List<NoteModel>? searchedNotes;
  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadNoteCubit>(context).readNote();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 13,
          right: 13,
          top: widget.isSearchActive ? 24 : 16,
          bottom: 32),
      child: NotesListView(
        searchedNotes: widget.searchedNotes,
      ),
    );
  }
}
