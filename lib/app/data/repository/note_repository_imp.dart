import 'package:flutter_getx_sqlite/app/data/model/note_model.dart';
import 'package:flutter_getx_sqlite/app/data/provider/note_provider.dart';
import 'package:flutter_getx_sqlite/app/data/repository/note_repository.dart';

class NoteRepositoryImp implements NoteRepository {
  final NoteProvider api;
  NoteRepositoryImp(this.api);

  @override
  getAll() {
    return api.getAll();
  }

  @override
  save(Note note) {
    return api.save(note);
  }

  @override
  update(Note note) {
    return api.update(note);
  }

  @override
  delete(int id) {
    return api.delete(id);
  }
}
