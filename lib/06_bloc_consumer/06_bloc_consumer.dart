import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';

class LearnBlocConsumer extends StatelessWidget {
  LearnBlocConsumer({Key? key}) : super(key: key);

  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: _counter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 24),
              );
            },
            buildWhen: (previous, current) {
              if (current >= 5) {
                return true;
              } else {
                return false;
              }
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Angka ganjil $state'),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current.isOdd) {
                return true;
              } else {
                return false;
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _counter.increment();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  _counter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
