import 'package:flutter/material.dart';
import 'package:flutter_getx_sqlite/app/data/provider/note_provider.dart';
import 'package:flutter_getx_sqlite/app/data/repository/note_repository_imp.dart';
import 'package:flutter_getx_sqlite/app/modules/notes/note_controller.dart';
import 'package:get/get.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController(
      NoteRepositoryImp(NoteProvider()),
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('GetX e SQLite test')),
      body: Obx(() {
        if (controller.loading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.noteList.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(controller.noteList[index].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    controller.editNote(controller.noteList[index]);
                  },
                ),
                IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'Excluir Nota',
                          middleText:
                              'Excluir nota de título ${controller.noteList[index].title}?',
                          textCancel: 'Cancelar',
                          textConfirm: 'Excluir',
                          onConfirm: () {
                            controller
                                .deleteNote(controller.noteList[index].id!);
                            if (controller.loading.value == true) {
                              Get.dialog(
                                const Center(
                                    child: CircularProgressIndicator()),
                              );
                            }
                          });
                    }),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.addNote();
        },
      ),
    );
  }
}
