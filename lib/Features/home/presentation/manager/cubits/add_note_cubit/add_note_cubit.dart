import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../data/models/note_model.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit(this.homeRepo) : super(InitialAddNoteState());

  Color color = colors[0];
  final HomeRepo homeRepo;

  Future<void> addNote({required NoteModel note}) async {
    note.color = color.value;
    emit(LoadingAddNoteState());
    var res = await homeRepo.addNote(note: note);
    res.fold((error) {
      emit(FailureAddNoteState(errMessage: error));
    }, (noteNum) {
      emit(SuccessAddNoteState());
    });
  }
  
}
