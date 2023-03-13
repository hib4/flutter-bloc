import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'name': '', 'age': 1});

  void changeName(String name) {
    emit({
      'name': name,
      'age': state['age'],
    });
  }

  void changeAge(int age) {
    emit({
      'name': state['name'],
      'age': age,
    });
  }
}
