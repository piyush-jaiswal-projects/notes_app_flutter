import 'package:notes_app_flutter/domain/models/note_model.dart';
import 'package:notes_app_flutter/data/datasources/local/notes.dart';

class NotesRepository {

  void addNote(Notes note) {
    sampleNotes.add(note);
  }

  void deleteNoteById(String id) {
    sampleNotes.removeWhere((note) => note.id == id);
  }

  List<Notes> getAllNotes() {
    return sampleNotes;
  }
}
