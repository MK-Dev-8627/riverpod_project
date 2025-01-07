import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/multi_state_provider.dart';
import 'package:riverpod_project/providers/state_notifier_provider.dart';

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
              // final search = ref.watch(stateNotifierProvider).search;
              final search = ref.watch((stateNotifierProvider).select((state)=> state.search));
              print('stateNotifierProvider');
              return Text(search,style: TextStyle(fontSize: 24),);
            }),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                // decoration:
                onChanged: (value){
                  ref.read(stateNotifierProvider.notifier).search(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'search...'
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer(builder: (context, ref, child) {
              final isShow = ref.watch((stateNotifierProvider).select((state)=> state.isShow));
              print('isShow stateNotifierProvider');
              return Switch(value: isShow, onChanged: (value){
                ref.read(stateNotifierProvider.notifier).isSwitch(value);
              });
            }),

          ],
        ),
      ),
    );
  }
}
