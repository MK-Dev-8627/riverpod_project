import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/models/item_model.dart';
import 'package:riverpod_project/providers/favourite/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
      : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItems() {
    final items = [
      Item(id: '1', name: 'iPhone', isFav: true),
      Item(id: '2', name: 'MacBook', isFav: false),
      Item(id: '3', name: 'Samsung Ultra', isFav: false),
      Item(id: '4', name: 'Google Pixel 9', isFav: true),
      Item(id: '5', name: 'iPad Pro 13', isFav: false),
      Item(id: '6', name: 'G-force 3060', isFav: false),
    ];
    state =
        state.copyWith(allItems: items.toList(), filteredItems: items.toList());
  }

  void getFiltered(String search) {
    state = state.copyWith(filteredItems: _filterList(state.allItems, search));
  }

  List<Item> _filterList(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void getFavouriteList(String option) {
    state = state.copyWith(filteredItems: _favouriteList(state.allItems, option));
  }

  List<Item> _favouriteList(List<Item> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items
        .where((item) => item.isFav == true)
        .toList();
  }

  void addAndRemoveFromFavourite(String id, bool isFav){
    int  foundIndex = state.filteredItems.indexWhere((item)=> item.id == id);
    state.filteredItems[foundIndex].isFav = !isFav;
    state = state.copyWith(filteredItems: state.filteredItems);
  }

}
