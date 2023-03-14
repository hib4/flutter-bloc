import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/14_extension_method/widget/number.dart';

import 'bloc/user_bloc.dart';

class LearnExtensionMethod extends StatelessWidget {
  const LearnExtensionMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc user = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Extension Method'),
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
                  user.incrementHeight();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  user.decrementHeight();
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
