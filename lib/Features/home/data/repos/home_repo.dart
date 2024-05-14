
import 'package:dartz/dartz.dart';

import '../models/note_model.dart';

abstract class HomeRepo {
  Future<Either<String ,void>> addNote({required NoteModel note});
  List<NoteModel> readNote();
}
