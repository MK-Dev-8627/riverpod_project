import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/favourite/favourite_provider.dart';
import 'package:riverpod_project/providers/multi_state_provider.dart';
import 'package:riverpod_project/providers/state_notifier_provider.dart';
import 'package:riverpod_project/providers/todo_app_provider.dart';

class FavouriteView extends ConsumerWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favourite Items'),
        actions: [
          PopupMenuButton(
              onSelected: (value){
                ref.read(favouriteProvider.notifier).getFavouriteList(value);
              },
              itemBuilder: (context){
            return [
              PopupMenuItem(
                  value: 'All',
                  child: Text('All')),
              PopupMenuItem(
                  value: 'Favourite',
                  child: Text('Favourite')),
            ];
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder()
              ),
              onChanged: (value){
                ref.read(favouriteProvider.notifier).getFiltered(value);
              },
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final favouriteList = ref.watch(favouriteProvider).filteredItems;
                print('favouriteProvider');
                return favouriteList.isEmpty
                    ? Text(
                        'No Data found!',
                        style: TextStyle(fontSize: 20),
                      )
                    : ListView.builder(
                        itemCount: favouriteList.length,
                        itemBuilder: (context, index) {
                          final item = favouriteList[index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                item.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    ref.read(favouriteProvider.notifier).addAndRemoveFromFavourite(item.id, item.isFav);
                                  },
                                  icon: Icon(
                                    item.isFav? Icons.favorite: Icons.favorite_border,
                                    color: item.isFav? Colors.red: null,
                                  )),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     IconButton(
                              //         onPressed: () {
                              //           ref.read(todoAppProvider.notifier).updateItem(item.id,'Updated Item');
                              //         },
                              //         icon: Icon(
                              //           Icons.edit,
                              //           color: Colors.green,
                              //         )),
                              //     IconButton(
                              //         onPressed: () {
                              //           ref.read(todoAppProvider.notifier).deleteItem(item.id);
                              //         },
                              //         icon: Icon(
                              //           Icons.delete,
                              //           color: Colors.red,
                              //         )),
                              //   ],
                              // ),
                            ),
                          );
                        });
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItems();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
