import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/Features/home/presentation/manager/cubits/read_note_cubit/read_note_states.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/note_model.dart';
import '../../data/repos/home_repo_impl.dart';
import '../manager/cubits/add_note_cubit/add_note_cubit.dart';
import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/cusom_search_bar.dart';
import 'widgets/custom_app_bar_container.dart';
import 'widgets/custom_app_bar_text.dart';
import 'widgets/notes_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSearchActive = false;
  List<NoteModel>? searchedNotes;
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64),
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => AddNoteCubit(HomeRepoImpl()),
                child: const AddNoteBottomSheet(),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(253, 0, 0, 0),
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: !isSearchActive
            ? const CustomAppBarText(title: 'Notes', fontSize: 28)
            : CustomSearchBar(
                controller: controller,
                onChanged: (value) {
                  searchedNotes = BlocProvider.of<ReadNoteCubit>(context)
                      .listOfNotes
                      .where((e) =>
                          e.title.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                  setState(() { });
                },
                onClose: () {
                  FocusScope.of(context).unfocus();
                  searchedNotes = null;
                  controller.clear();
                  setState(() {});
                },
              ),
        actions: [
          BlocBuilder<ReadNoteCubit, ReadNoteStates>(
            builder: (context, state) {
              return Visibility(
                visible: BlocProvider.of<ReadNoteCubit>(context)
                    .listOfNotes
                    .isNotEmpty,
                child: CustomAppBarContainer(
                  iconData: !isSearchActive
                      ? Icons.search_rounded
                      : Icons.arrow_forward,
                  onpressed: () {
                    if (!isSearchActive) {
                      isSearchActive = true;
                      setState(() {});
                    } else {
                      controller.clear();
                      searchedNotes = null;
                      isSearchActive = false;
                      setState(() {});
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: NotesViewBody(
        isSearchActive: isSearchActive,
        searchedNotes: searchedNotes,
      ),
    );
  }
}
