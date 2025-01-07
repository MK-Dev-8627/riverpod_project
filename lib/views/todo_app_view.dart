import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/multi_state_provider.dart';
import 'package:riverpod_project/providers/state_notifier_provider.dart';
import 'package:riverpod_project/providers/todo_app_provider.dart';

class ToDoAppView extends ConsumerWidget {
  const ToDoAppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer(builder: (context, ref, child) {
                  final todoList = ref.watch(todoAppProvider);
                  print('todoAppProvider');
                  return todoList.isEmpty
                      ? Text(
                          'No Data found!',
                          style: TextStyle(fontSize: 20),
                        )
                      : ListView.builder(
                          itemCount: todoList.length,
                          itemBuilder: (context, index) {
                            final item = todoList[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          ref.read(todoAppProvider.notifier).updateItem(item.id,'Updated Item');
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          ref.read(todoAppProvider.notifier).deleteItem(item.id);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoAppProvider.notifier).addItem('New Item');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
