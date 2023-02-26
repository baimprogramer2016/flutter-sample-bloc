import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Stream<int> countStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Stream"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: countStream(),
          builder: (context, snapshot) {
            print("DISSINI BUILD");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text(
                  "Loading",
                  style: TextStyle(fontSize: 50),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(fontSize: 50),
                ),
              );
            }
          },
        ));
  }
}
