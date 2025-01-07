import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item_model.dart';

final todoAppProvider =
    StateNotifierProvider<ToDoNotifier, List<Item>>((ref) {
  return ToDoNotifier();
});

class ToDoNotifier extends StateNotifier<List<Item>> {
  ToDoNotifier() : super([]);

 void addItem(String name){
   final item = Item(id: DateTime.now().toString(), name: name, isFav: false);
   state.add(item);
   state = state.toList();
 }
  void updateItem(String id, String name){
    int  foundIndex = state.indexWhere((item)=> item.id == id);
    state[foundIndex].name = name;
    state = state.toList();
  }

  void deleteItem(String id){
    state.removeWhere((item)=> item.id == id);
    state = state.toList();
  }

}


