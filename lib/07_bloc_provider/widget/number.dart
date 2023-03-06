import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/07_bloc_provider/bloc/counter.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Counter, int>(
      bloc: BlocProvider.of<Counter>(context),
      builder: (context, state) {
        return Text(
          '$state',
          style: const TextStyle(fontSize: 24),
        );
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Angka genap $state'),
            duration: const Duration(milliseconds: 500),
          ),
        );
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
