import 'note_service.dart';
import '../../models/note.dart';

class NoteServiceMock extends NoteService {
  final List<Note> _notes = [];

  @override
  Future<List<Note>?>? fetchNotes() async {
    await Future.delayed(const Duration(microseconds: 200));
    return _notes;
  }

  @override
  Future<Note?>? getNote(id) async {
    await Future.delayed(const Duration(microseconds: 200));
    try {
      return _notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Note?>? updateNote({required id, Note? data}) async {
    await Future.delayed(const Duration(microseconds: 200));
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1 && data != null) {
      _notes[index] = data;
      return data;
    }
    return Future.error("Note not found or data is null");
  }

  @override
  Future<void> removeNote(id) async {
    await Future.delayed(const Duration(microseconds: 200));
    _notes.removeWhere((note) => note.id == id);
  }

  @override
  Future<Note?>? addNote(Note data) async {
    await Future.delayed(const Duration(microseconds: 200));
    data.id = _notes.length + DateTime.now().millisecondsSinceEpoch;
    _notes.add(data);
    return data;
  }
}