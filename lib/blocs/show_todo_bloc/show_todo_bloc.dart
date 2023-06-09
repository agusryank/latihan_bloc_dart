import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_todo_event.dart';
part 'show_todo_state.dart';

class ShowTodoBloc extends Bloc<ShowTodoEvent, ShowTodoState> {
  ShowTodoBloc() : super(ShowTodoInitial()) {
    on<ShowTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
