import 'package:flutter/material.dart';

import '../../models/note.dart';
import '../view.dart';
import 'main_viewmodel.dart';

class MainFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      shouldRebuild: false,
      builder: (_, vm, ___) => FloatingActionButton(
        tooltip: 'Add a new note',
        onPressed: () async {
          return vm.addNote(Note(title: 'Untitled note', content: 'Content'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
