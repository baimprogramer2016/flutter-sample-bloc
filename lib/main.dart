import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.nilaiUtama = 0})
      : super(nilaiUtama); //super ini ada angka 0 dimana nilai utama state

  int nilaiUtama;

  int? current;
  int? next;

  void tambahData() {
    emit(state + 1); //emit untuk setter lagsg di get
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError

    super.onError(error, stackTrace);
    print(error);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(nilaiUtama: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Observer Cubit"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: myCounter.nilaiUtama, //initial data
              stream: myCounter.stream,
              builder: (context, snapshot) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "Current : ${myCounter.current}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        "Next : ${myCounter.next}",
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.kurangData();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.tambahData();
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ));
  }
}
