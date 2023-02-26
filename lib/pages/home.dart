import 'package:flutter/material.dart';
import 'package:stream/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Listener"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocListener<Counter, int>(
          bloc: myCounter,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text("Muncul Notif jika $state")),
            );
          },
          listenWhen: (previous, current) {
            if (current == 5) {
              return true;
            } else {
              return false;
            }
          },
          child: BlocBuilder<Counter, int>(
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
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
