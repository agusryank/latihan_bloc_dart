import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;

  final int initialActiveTodoCount;
  final TodoListCubit todoListCubit;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('ActiveTodoCountCubit: todoListState: $todoListState');
      final int activeTodoCount =
          todoListState.todos.where((todo) => !todo.completed).toList().length;
      emit(state.copyWith(activeTodoCount: activeTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
