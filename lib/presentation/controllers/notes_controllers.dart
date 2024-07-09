import 'package:get/get.dart';
import 'package:notes_app_flutter/data/repositories/notes_repository.dart';
import 'package:notes_app_flutter/domain/models/note_model.dart';

class NotesController extends GetxController {
  final NotesRepository notesRepository = Get.put(NotesRepository());
  RxList<Notes> notesList = RxList<Notes>();

  @override
  void onInit() {
    super.onInit();
    // Initialize notesList with data from NotesRepository
    notesList.assignAll(notesRepository.getAllNotes());
  }

  void addNote(Notes note) {
    notesList.add(note);
  }

  void deleteNoteById(String id) {
    notesList.removeWhere((note) => note.id == id);
  }
}
