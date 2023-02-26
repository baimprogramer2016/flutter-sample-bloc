import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream/bloc/counter.dart';

import 'data_widget.dart';

class HomePage extends StatelessWidget {
  Counter mycounter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Provider"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      mycounter.increment();
                    },
                    child: const SizedBox(
                      width: 70,
                      height: 100,
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                const DataWidget(), //lempar data
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      mycounter.increment();
                    },
                    child: const SizedBox(
                      width: 70,
                      height: 100,
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
