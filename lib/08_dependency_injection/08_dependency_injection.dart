import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/08_dependency_injection/widget/number.dart';

import 'bloc/counter.dart';

class LearnDependencyInjection extends StatelessWidget {
  const LearnDependencyInjection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Dependency Injection'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NumberWidget(),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  counter.increment();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  counter.decrement();
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
