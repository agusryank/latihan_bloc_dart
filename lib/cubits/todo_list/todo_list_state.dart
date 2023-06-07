part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todos;
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      TodoModel(id: '1', desc: 'Learn Flutter'),
      TodoModel(
        id: '2',
        desc: 'Learn Dart',
      ),
      TodoModel(id: '3', desc: 'Learn Bloc'),
      TodoModel(id: '4', desc: 'Learn Cubit'),
      TodoModel(id: '5', desc: 'Learn State Management'),
      TodoModel(id: '6', desc: 'Learn Provider'),
      TodoModel(id: '7', desc: 'Learn MobX'),
      TodoModel(id: '8', desc: 'Learn GetX'),
      TodoModel(id: '9', desc: 'Learn Riverpod'),
      TodoModel(id: '10', desc: 'Learn Hive'),
      TodoModel(id: '11', desc: 'Learn Firebase'),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
