import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: 0.5, show: false);
});

class AppState {
  final double slider;
  final bool show;
  AppState({required this.slider, required this.show});

  AppState copyWith({double? slider, bool? show}) {
    return AppState(slider: slider ?? this.slider, show: show ?? this.show);
  }
}
