import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter(Filter filter) {
    emit(state.copyWith(filter: filter));
  }
}
