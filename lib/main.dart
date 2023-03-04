import 'package:flutter/material.dart';
import 'package:learn_bloc/01_stream/01_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Learn BLoC',
      debugShowCheckedModeBanner: false,
      home: LearnStream(),
    );
  }
}
