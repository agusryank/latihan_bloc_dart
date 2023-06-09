import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/active_todo_count/active_todo_count_cubit.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Todos App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount.toString()} Actives Todos',
          style: TextStyle(fontSize: 14, color: Colors.redAccent),
        ),
      ],
    );
  }
}
