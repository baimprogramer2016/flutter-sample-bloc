import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/home.dart';
import 'bloc/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
