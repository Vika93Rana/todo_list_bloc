import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_bloc/cubit/todo_cubit.dart';
import 'package:todo_list_bloc/model/todo_model.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoCubit, List<ToDO>>(
        // bloc: TodoCubit(),
        /// no need to specify the bloc as we have BlocProvider at the root
        /// because that's where it looks where the value not provided
        /// if you want to overide the bloc this is the place
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,

            /// going to be list of the state provided in Cubit
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
