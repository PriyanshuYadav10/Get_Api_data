import 'package:flutter/material.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('JSONPlaceholder API'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return GridTile(
                  // title: Text(snapshot.data![index]['id'].toString()),
                  // subtitle: Text(snapshot.data![index]['title']),
                  child: Card(
                    color: Colors.teal.shade100,
                    elevation: 15,
                    child: Column(
                      children: [
                        Text(
                          snapshot.data![index]['id'].toString(),
                        ),
                        Text(snapshot.data![index]['title']),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
