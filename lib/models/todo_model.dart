import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter { all, active, completed }

Uuid uuid = Uuid();

class TodoModel extends Equatable {
  final String id;
  final String desc;
  final bool completed;
  TodoModel({
    String? id,
    required this.desc,
    this.completed = false,
  }) : this.id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, completed];

  @override
  String toString() => 'TodoModel(id: $id, desc: $desc, completed: $completed)';
}
