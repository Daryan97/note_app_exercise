import 'main_viewmodel.dart';
import '/screens/view.dart';
import 'package:flutter/material.dart';

import 'note_editor_tile.dart';
import 'note_tile.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, int>(
      selector: (_, vm) => vm.listCount!,
      builder: (_, vm, __, ___) => ListView.separated(
        itemCount: vm.listCount!,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) =>
            vm.editIndex == index ? NoteEditorTile(index) : NoteTile(index),
      ),
    );
  }
}
