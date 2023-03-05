import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LearnObserverCubit extends StatelessWidget {
  LearnObserverCubit({Key? key}) : super(key: key);

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
              return Column(
                children: [
                  Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Current : ${_counter.currentNumber ?? 0}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Next : ${_counter.nextNumber ?? 0}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
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

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialNumber = 0}) : super(initialNumber);

  int initialNumber;
  int? currentNumber;
  int? nextNumber;

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
    currentNumber = change.currentState;
    nextNumber = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
