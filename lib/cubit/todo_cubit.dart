import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_bloc/model/todo_model.dart';
// part 'todo_state.dart';

class TodoCubit extends Cubit<List<ToDO>> {
  /// in the to do app the state is the list of tasks
  TodoCubit() : super([]);

  /// intial state is passed to super class const

  addToDo(String title) {
    if(title.isEmpty){
      addError('Title cannot be empty');
      return;
    }

    final todo = ToDO(name: title, createdAt: DateTime.now());
    // state.add(todo);
    // emit(state); // this will not work becuase emit updates only when it
    /// recognises that the current state and new state are different (here
    /// is the case of instance
    emit([...state, todo]); /// the new ptoDo will be added to the new state
    /// along with the previous state
  }
  @override
  void onChange(Change<List<ToDO>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print('todo cubit: $error');
  }
}
