import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = TodoModel(desc: todoDesc);
    final newTodos = List<TodoModel>.from(state.todos)..add(newTodo);
    emit(state.copyWith(todos: newTodos));
  }

  void editTodo(String todoId, String newDesc) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == todoId) {
        return TodoModel(id: todoId, desc: newDesc, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodoStatus(String todoId) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == todoId) {
        return TodoModel(
            id: todoId, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(TodoModel todo) {
    final newTodos =
        state.todos.where((TodoModel t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
