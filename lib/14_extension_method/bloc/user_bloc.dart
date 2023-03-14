import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'name': 'Hiba', 'height': 170});

  @override
  void onChange(Change<Map<String, dynamic>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }

  void incrementHeight() {
    emit({
      'name': state['name'],
      'height': state['height'] + 1,
    });
  }

  void decrementHeight() {
    if (state['height'] > 1) {
      emit({
        'name': state['name'],
        'height': state['height'] - 1,
      });
    }
  }
}
