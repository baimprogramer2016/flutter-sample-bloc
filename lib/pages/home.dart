import 'package:flutter/material.dart';
import 'package:stream/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Builder"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<Counter, int>(
          bloc: myCounter,
          buildWhen: (previous, current) {
            return (current == 5) ? true : false;
          },
          builder: (context, state) {
            return Text(
              '$state',
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                myCounter.decrement();
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                myCounter.increment();
              },
              icon: const Icon(Icons.add),
            )
          ],
        )
      ]),
    );
  }
}
