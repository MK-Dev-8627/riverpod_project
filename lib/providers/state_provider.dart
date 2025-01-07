import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = StateProvider<int>((ref) {
  return 0;
});

final showProvider = StateProvider<bool>((ref) {
  return false;
});


class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
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
              print('counterProvider');
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

            Consumer(builder: (context, ref, child){
              final show = ref.watch(showProvider);
              print('showProvider');
              return Column(
                children: [
                  Icon(show ? Icons.visibility_off : Icons.visibility ,size: 50,),
                  Switch(value: show, onChanged: (value){
                    ref.read(showProvider.notifier).state = value;
                  })
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
