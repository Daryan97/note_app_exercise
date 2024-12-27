import 'package:flutter/material.dart';

import '/screens/main/main_viewmodel.dart';
import '../view.dart';
import 'widgets/custom_text_field.dart';

class NoteEditorTile extends StatelessWidget {
  const NoteEditorTile(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (_, vm, __) {
        final note = vm.getNote(index);

        return ListTile(
          title: CustomTextField(
            initialValue: note.title,
            onChanged: (value) => note.title = value,
          ),
          subtitle: CustomTextField(
            maxLines: 3,
            initialValue: note.content,
            onChanged: (value) => note.content = value,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.blue,
            ),
            onPressed: () {
              vm.removeNote(note.id);
              vm.editIndex = null;
            },
          ),
        );
      },
    );
  }
}
