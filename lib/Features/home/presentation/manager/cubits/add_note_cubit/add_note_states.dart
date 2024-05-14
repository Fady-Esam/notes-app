class AddNoteStates {}

class InitialAddNoteState extends AddNoteStates {}
class SuccessAddNoteState extends AddNoteStates {}
class FailureAddNoteState extends AddNoteStates {
  final String errMessage;

  FailureAddNoteState({required this.errMessage});

}
class LoadingAddNoteState extends AddNoteStates {}
