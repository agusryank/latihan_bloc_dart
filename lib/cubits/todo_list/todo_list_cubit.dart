import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_cubit/models/todo_model.dart';
part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    Fluttertoast.showToast(msg: 'Added todo: $todoDesc');

    final newTodo = TodoModel(desc: todoDesc);
    final newTodos = List<TodoModel>.from(state.todos)..add(newTodo);
    emit(state.copyWith(todos: newTodos));
  }

  void editTodo(String todoId, String newDesc) {
    Fluttertoast.showToast(msg: 'Edited todo: $newDesc');
    final newTodos = state.todos.map((todo) {
      if (todo.id == todoId) {
        return TodoModel(id: todoId, desc: newDesc, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((TodoModel todo) {
      if (todo.id == id) {
        return TodoModel(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(TodoModel todo) {
    Fluttertoast.showToast(msg: 'Removed todo: ${todo.desc}');
    final newTodos =
        state.todos.where((TodoModel t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
