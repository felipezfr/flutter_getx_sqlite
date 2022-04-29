import 'package:flutter_getx_sqlite/app/data/model/note_model.dart';
import 'package:flutter_getx_sqlite/app/services/notes_service.dart';
import 'package:get/get.dart';

class NoteProvider {
  final notesService = Get.find<NotesService>();

  Future<List<Note>> getAll() async {
    // await Future.delayed(Duration(seconds: 2));
    return await notesService.getAll();
  }

  Future<Note> save(Note note) async {
    // await Future.delayed(const Duration(seconds: 2));
    return await notesService.save(note);
  }

  Future<Note> update(Note note) async {
    // await Future.delayed(const Duration(seconds: 2));
    return await notesService.update(note);
  }

  Future<int> delete(int noteId) async {
    // await Future.delayed(const Duration(seconds: 2));
    return await notesService.delete(noteId);
  }
}
