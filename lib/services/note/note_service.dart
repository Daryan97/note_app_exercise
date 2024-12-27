import '../../models/note.dart';

abstract class NoteService {
  Future<List<Note>?>? fetchNotes();
  Future<Note?>? getNote(id);
  Future<Note?>? updateNote({required id, Note? data});
  Future<void> removeNote(id);
  Future<Note?>? addNote(Note data);
}
