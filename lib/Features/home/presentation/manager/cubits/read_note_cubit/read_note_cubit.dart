import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import '../../../../data/models/note_model.dart';
import 'read_note_states.dart';

class ReadNoteCubit extends Cubit<ReadNoteStates> {
  ReadNoteCubit(this.homeRepo) : super(InitialReadNoteState());

  List<NoteModel> listOfNotes = [];
  final HomeRepo homeRepo;

  void readNote() {
    List<NoteModel> notes = homeRepo.readNote();
    listOfNotes = notes;
    emit(SuccessReadNoteState());
  }
}
