import 'package:go_router/go_router.dart';
import 'package:notes_app/Features/home/data/models/note_model.dart';
import 'package:notes_app/Features/home/presentation/views/edit_note_view.dart';
import 'package:notes_app/Features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/editNoteView',
        builder: (context, state) => EditNoteView(
          noteModel: state.extra as NoteModel,
        ),
      ),
    ],
  );
}
