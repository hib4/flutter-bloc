import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/01_stream/01_stream.dart';
import 'package:learn_bloc/02_basic_cubit/02_basic_cubit.dart';
import 'package:learn_bloc/03_observer_cubit/03_observer_cubit.dart';
import 'package:learn_bloc/04_bloc_builder/04_bloc_builder.dart';
import 'package:learn_bloc/05_bloc_listener/05_bloc_listener.dart';
import 'package:learn_bloc/06_bloc_consumer/06_bloc_consumer.dart';
import 'package:learn_bloc/07_bloc_provider/07_bloc_provider.dart';
import 'package:learn_bloc/09_bloc_provider_value/09_bloc_provider_value.dart';
import 'package:learn_bloc/10_bloc_access/bloc/counter.dart';
import 'package:learn_bloc/08_dependency_injection/08_dependency_injection.dart';
import 'package:learn_bloc/10_bloc_access/10_bloc_access.dart';
import 'package:learn_bloc/10_bloc_access/other/other.dart';
import 'package:learn_bloc/10_bloc_access/routes/routes.dart';
import 'package:learn_bloc/11_multi_bloc_provider/11_multi_bloc_provider.dart';
import 'package:learn_bloc/12_multi_bloc_listener/12_multi_bloc_listener.dart';
import 'package:learn_bloc/12_multi_bloc_listener/bloc/counter.dart';
import 'package:learn_bloc/12_multi_bloc_listener/bloc/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeBloc _theme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => _theme,
        ),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        bloc: _theme,
        builder: (context, state) {
          return MaterialApp(
            title: 'Learn BLoC',
            debugShowCheckedModeBanner: false,
            theme: state ? ThemeData.light() : ThemeData.dark(),
            home: const LearnMultiBlocListener(),
          );
        },
      ),
    );
  }
}
