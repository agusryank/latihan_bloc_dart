import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchState.initial());

  void setQuery(String query) {
    emit(state.copyWith(query: query));

    log('TodoSearchCubit: setQuery: ${state.query}');
  }
}
