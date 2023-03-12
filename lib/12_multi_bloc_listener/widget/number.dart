import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/12_multi_bloc_listener/bloc/counter.dart';
import 'package:learn_bloc/12_multi_bloc_listener/bloc/theme.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counter = context.read<CounterBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeBloc, bool>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tema ${state ? 'Terang' : 'Gelap'} aktif'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        BlocListener<CounterBloc, int>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Angka Genap $state'),
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
        ),
      ],
      child: BlocBuilder<CounterBloc, int>(
        bloc: counter,
        builder: (context, state) {
          return Text(
            '$state',
            style: const TextStyle(fontSize: 24),
          );
        },
      ),
    );
  }
}
