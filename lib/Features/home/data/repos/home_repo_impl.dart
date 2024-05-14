import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Features/home/data/models/note_model.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<String, void>> addNote({required NoteModel note}) async {
    try {
      var notesBox = Hive.box<NoteModel>('notes');
      await notesBox.add(note);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  List<NoteModel> readNote() {
    var notesBox = Hive.box<NoteModel>('notes');
    return notesBox.values.toList();
  }
}
