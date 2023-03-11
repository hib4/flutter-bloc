import 'package:flutter/material.dart';
import 'package:learn_bloc/10_bloc_access/10_bloc_access.dart';
import 'package:learn_bloc/10_bloc_access/other/other.dart';

class Routes {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LearnBlocAccess(),
        );
      case '/other':
        return MaterialPageRoute(
          builder: (context) => const Other(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LearnBlocAccess(),
        );
    }
  }
}
