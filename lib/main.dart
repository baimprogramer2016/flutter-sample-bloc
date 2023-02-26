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

  void tambahData() {
    emit(state + 1); //emit untuk setter lagsg di get
  }

  void kurangData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(nilaiUtama: 0);

  @override
  Widget build(BuildContext context) {
    print("Build Halaman");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Basic Cubit"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: myCounter.nilaiUtama, //initial data
              stream: myCounter.stream,
              builder: (context, snapshot) {
                print("Build Hanya yang di state");
                return Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(fontSize: 50),
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
