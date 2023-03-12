import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/11_multi_bloc_provider/bloc/counter.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, int>(
      bloc: context.read<CounterBloc>(),
      builder: (context, state) {
        return Text(
          '$state',
          style: const TextStyle(fontSize: 24),
        );
      },
      listener: (context, state) {

      },
      listenWhen: (previous, current) {
        if (current.isEven) {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}
