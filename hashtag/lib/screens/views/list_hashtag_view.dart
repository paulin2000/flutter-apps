import 'package:flutter/material.dart';

const List<Map<String, dynamic>> listHashtags = [
  {'name': '#flutter'},
  {'name': '#dart'}
];

class ListHashtagView extends StatelessWidget {
  const ListHashtagView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: listHashtags.isEmpty
          ? const Center(child: Text('No hashtags'))
          : ListView.builder(
              itemCount: listHashtags.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(index.toString()),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$index dismissed')));
                    },
                    child: Card(
                        child: ListTile(
                            title: Text(listHashtags[index]['name']))));
              }),
    );
    //  Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: const <Text>[Text('Hash tag view')],
    // );
  }
}
