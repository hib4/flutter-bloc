import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LearnBasicCubit extends StatelessWidget {
  LearnBasicCubit({Key? key}) : super(key: key);

  final CounterCubit _counter = CounterCubit(initialNumber: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: _counter.initialNumber,
              stream: _counter.stream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: const TextStyle(fontSize: 24),
                );
              }),
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

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialNumber = 0}) : super(initialNumber);

  int initialNumber;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
