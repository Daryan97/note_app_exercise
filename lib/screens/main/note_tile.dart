import 'package:flutter/material.dart';

import 'main_viewmodel.dart';
import '../view.dart';
import 'note_editor_tile.dart';

class NoteTile extends StatelessWidget {
  const NoteTile(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, int?>(
      selector: (_, vm) => vm.editIndex,
      builder: (_, vm, editIndex, __) {
        if (editIndex == index) {
          return NoteEditorTile(index);
        }

        final note = vm.getNote(index);
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          onLongPress: () => vm.editIndex = (index == editIndex) ? null : index,
          onTap: () {
            final currentEditIndex = vm.editIndex;
            if (currentEditIndex != null) {
              vm.updateNote(
                  index: currentEditIndex, data: vm.getNote(currentEditIndex));
              vm.editIndex = null;
            }
          },
        );
      },
    );
  }
}
