import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return 'default';
});

// class ProviderExample extends ConsumerWidget {
//   const ProviderExample({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Provider'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, ref, child) {
//             final name = ref.watch(nameProvider);
//             return Center(child: Text(name,style: TextStyle(fontSize: 25),));
//           }),
//         ],
//       ),
//     );
//   }
// }
class ProviderExample extends ConsumerStatefulWidget {
  const ProviderExample({super.key});

  @override
  ConsumerState<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends ConsumerState<ProviderExample> {

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(name,style: TextStyle(fontSize: 25),)),
        ],
      ),
    );
  }
}

