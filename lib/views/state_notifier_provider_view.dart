import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/multi_state_provider.dart';

class StateNotifierProviderView extends ConsumerWidget {
  const StateNotifierProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('State Notifier Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider).slider;
              final show = ref.watch(sliderProvider).show;
              print('sliderProvider');
              return Column(
                children: [
                  Icon(
                    show ? Icons.visibility_off : Icons.visibility,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration:
                        BoxDecoration(color: Colors.red.withOpacity(slider)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                      value: slider,
                      onChanged: (value) {
                        final stateProvider = ref.read(sliderProvider.notifier);
                        if (value == 1) {
                          stateProvider.state = stateProvider.state
                              .copyWith(slider: value, show: true);
                        } else {
                          stateProvider.state = stateProvider.state
                              .copyWith(slider: value, show: false);
                        }
                      }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
