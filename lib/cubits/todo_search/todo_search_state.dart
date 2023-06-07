part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String query;
  const TodoSearchState({
    required this.query,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(query: '');
  }

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'TodoSearchState(query: $query)';

  TodoSearchState copyWith({
    String? query,
  }) {
    return TodoSearchState(
      query: query ?? this.query,
    );
  }
}
