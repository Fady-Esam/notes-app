import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/core/utils/app_router.dart';
import 'Features/home/data/models/note_model.dart';
import 'Features/home/presentation/manager/cubits/read_note_cubit/read_note_cubit.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNoteCubit(
        HomeRepoImpl(),
      ),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Notes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
