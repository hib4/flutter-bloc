import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/14_extension_method/14_extension_method.dart';
import 'package:learn_bloc/14_extension_method/bloc/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: const MaterialApp(
        title: 'Learn BLoC',
        debugShowCheckedModeBanner: false,
        home: LearnExtensionMethod(),
      ),
    );
  }
}
