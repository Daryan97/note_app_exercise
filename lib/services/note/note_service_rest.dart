import 'package:http/http.dart';

import '../../app/service_locator.dart';
import '../rest.dart';
import 'note_service.dart';
import '../../models/note.dart';

class NoteServiceRest extends NoteService {
  @override
  Future<Note?> addNote(Note data) async {
    try {
      final notes = await fetchNotes();
      data.id =
          (notes.length + DateTime.now().millisecondsSinceEpoch).toString();

      final response =
          await locator<RestService>().post('notes', data: data.toJson());
      fetchNotes(); // json-server returns the created object
      return Note.fromJson(response); // json-server returns the created object
    } catch (e) {
      print("Error in addNote: $e");
      return null;
    }
  }

  @override
  Future<List<Note>> fetchNotes() async {
    try {
      print("fetchNotes");
      final response = await locator<RestService>().get('notes');

      // json-server returns an array of objects
      if (response is List) {
        return response.map((note) => Note.fromJson(note)).toList();
      } else {
        print("Unexpected response format for fetchNotes: $response");
        return [];
      }
    } catch (e) {
      print("Error in fetchNotes: $e");
      return [];
    }
  }

  @override
  Future<Note?> getNote(dynamic id) async {
    try {
      final response =
          await locator<RestService>().get('notes/${id.toString()}');
      return Note.fromJson(
          response); // json-server returns the object for the given ID
    } catch (e) {
      print("Error in getNote: $e");
      return null;
    }
  }

  @override
  Future<void> removeNote(dynamic id) async {
    try {
      final reponse =
          await locator<RestService>().delete('notes/${id.toString()}');
    } catch (e) {
      if (e is Response) {
        print("removeNote $id: ${e.body}");
      } else {
        print("Error in removeNote: $e");
      }
    }
  }

  @override
  Future<Note?> updateNote({Note? data, required dynamic id}) async {
    try {
      final response = await locator<RestService>()
          .put('notes/${id.toString()}', data: data!.toJson());
      return Note.fromJson(response); // json-server returns the updated object
    } catch (e) {
      print("Error in updateNote: ${e}");
      return null;
    }
  }
}
