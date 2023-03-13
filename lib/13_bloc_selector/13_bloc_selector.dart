import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/13_bloc_selector/bloc/user_bloc.dart';

class LearnBlocSelector extends StatelessWidget {
  const LearnBlocSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc user = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state['name'],
              builder: (context, state) {
                print('BUILD NAME');
                return Text('NAME : $state');
              },
            ),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state['age'],
              builder: (context, state) {
                print('BUILD AGE');
                return Text('AGE : $state');
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              onChanged: (value) => user.changeName(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    user.changeAge(user.state['age'] + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    if (user.state['age'] > 1) {
                      user.changeAge(user.state['age'] - 1);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
