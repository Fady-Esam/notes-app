import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart';
import '../../../data/models/note_model.dart';
import '../../manager/cubits/add_note_cubit/add_note_cubit.dart';
import '../../manager/cubits/add_note_cubit/add_note_states.dart';
import '../../manager/cubits/read_note_cubit/read_note_cubit.dart';
import 'color_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? content;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 35,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is LoadingAddNoteState) {
              isLoading = true;
            } else if (state is SuccessAddNoteState) {
              BlocProvider.of<ReadNoteCubit>(context).readNote();
              GoRouter.of(context).pop();
              isLoading = false;
            } else if (state is FailureAddNoteState) {
              GoRouter.of(context).pop();
              isLoading = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.errMessage}, Please try again'),
                ),
              );
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: isLoading,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustsomTextField(
                        hint: 'Title',
                        onSaved: (value) => title = value,
                      ),
                      const SizedBox(height: 20),
                      CustsomTextField(
                        hint: 'Content',
                        maxlines: 7,
                        onSaved: (value) => content = value,
                      ),
                      const ColorListView(),
                      CustomButton(
                        isLoading: isLoading,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await BlocProvider.of<AddNoteCubit>(context)
                                .addNote(
                              note: NoteModel(
                                title: title!,
                                content: content!,
                                date: DateFormat.yMd().format(DateTime.now()),
                                color: BlocProvider.of<AddNoteCubit>(context)
                                    .color
                                    .value,
                              ),
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
