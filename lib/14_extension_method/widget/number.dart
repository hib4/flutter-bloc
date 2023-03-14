import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/14_extension_method/bloc/user_bloc.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserBloc user = context.read<UserBloc>();   // membaca 1x
    // UserBloc user = context.watch<UserBloc>();  // membaca berkali-kali
    print('BUILD SCAFFOLD');

    return Column(
      children: [
        // context.read()
        // Text(
        //   '${user.state}',
        //   style: const TextStyle(fontSize: 24),
        // ),

        // context.watch()
        // Builder(
        //   builder: (context) {
        //     UserBloc user = context.watch<UserBloc>();
        //     print('BUILD TEXT');
        //
        //     return Text(
        //       'HEIGHT : ${user.state['height']}',
        //       style: const TextStyle(fontSize: 24),
        //     );
        //   },
        // ),

        // context.select()
        Builder(
          builder: (context) {
            String name = context.select<UserBloc, String>((value) => value.state['name']);
            return Text(
              'NAME : $name',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
        Builder(
          builder: (context) {
            int height = context.select<UserBloc, int>((value) => value.state['height']);
            print('BUILD HEIGHT');

            return Text(
              'HEIGHT : $height',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ],
    );
  }
}
