import 'package:flutter_getx_sqlite/app/data/model/note_model.dart';

abstract class NoteRepository {
  getAll();

  save(Note note);

  update(Note note);

  delete(int id);
}
