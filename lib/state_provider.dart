import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = StateProvider<int>((ref) {
  return 0;
});
class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('State Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Consumer(builder: (context, ref, child){
              final count = ref.watch(counterProvider);
              return Column(
                children: [
                  Text('Count $count',style: TextStyle(fontSize: 25),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        ref.read(counterProvider.notifier).state--;
                      }, child: Icon(Icons.minimize)),
                      ElevatedButton(onPressed: (){
                        ref.read(counterProvider.notifier).state++;
                      }, child: Icon(Icons.add)),
                    ],
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
