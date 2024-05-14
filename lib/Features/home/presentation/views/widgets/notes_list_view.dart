import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/note_model.dart';
import '../../manager/cubits/read_note_cubit/read_note_cubit.dart';
import '../../manager/cubits/read_note_cubit/read_note_states.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key,  this.searchedNotes});

  final List<NoteModel>? searchedNotes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteStates>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: searchedNotes !=null ? searchedNotes!.length:BlocProvider.of<ReadNoteCubit>(context).listOfNotes.length,
          itemBuilder: (context, index) => NoteItem(
              noteModel:
                  searchedNotes !=null ? searchedNotes![index]:BlocProvider.of<ReadNoteCubit>(context).listOfNotes[index]),
        );
      },
    );
  }
}
