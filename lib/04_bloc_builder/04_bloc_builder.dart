import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';

class LearnBlocBuilder extends StatelessWidget {
  LearnBlocBuilder({Key? key}) : super(key: key);

  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: _counter,
            buildWhen: (previous, current) {
              if (current.isEven) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 24),
              );
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
