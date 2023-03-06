import 'package:flutter/material.dart';
import 'package:learn_bloc/01_stream/01_stream.dart';
import 'package:learn_bloc/02_basic_cubit/02_basic_cubit.dart';
import 'package:learn_bloc/03_observer_cubit/03_observer_cubit.dart';
import 'package:learn_bloc/04_bloc_builder/04_bloc_builder.dart';
import 'package:learn_bloc/05_bloc_listener/05_bloc_listener.dart';
import 'package:learn_bloc/06_bloc_consumer/06_bloc_consumer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn BLoC',
      debugShowCheckedModeBanner: false,
      home: LearnBlocConsumer(),
    );
  }
}
