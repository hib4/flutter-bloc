import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/11_multi_bloc_provider/bloc/theme.dart';
import 'package:learn_bloc/11_multi_bloc_provider/widget/number.dart';

import 'bloc/counter.dart';

class LearnMultiBlocProvider extends StatelessWidget {
  const LearnMultiBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc counter = context.read<CounterBloc>();
    ThemeBloc theme = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Multi Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme.changeTheme();
        },
        child: Icon(theme.state ? Icons.light_mode : Icons.dark_mode),
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
