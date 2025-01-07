import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '',isShow: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void isSwitch(bool isShow) {
    state = state.copyWith(isShow: isShow);
  }
}

class SearchState {
  final String search;
  final bool isShow;
  SearchState({required this.search, required this.isShow});

  SearchState copyWith({String? search, bool? isShow}) {
    return SearchState(
        search: search ?? this.search, isShow: isShow ?? this.isShow);
  }
}
