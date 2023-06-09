import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});

  @override
  Widget build(BuildContext contexts) {
    final todos = contexts.watch<FilteredTodosCubit>().state.filteredTodos;
    bool isEmpty = todos.isEmpty;

    if (isEmpty) {
      return Center(
        child: Text(
          'No Todos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return ListView.separated(
        shrinkWrap: true,
        primary: false,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            onDismissed: (val) {
              context.read<TodoListCubit>().removeTodo(
                    todos[index],
                  );
            },
            confirmDismiss: (direction) {
              return showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: Text('Delete Todo'),
                      content:
                          Text('Are you sure you want to delete this todo?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  });
            },
            dismissThresholds: const {
              DismissDirection.startToEnd: 0.2,
              DismissDirection.endToStart: 0.2,
            },
            secondaryBackground: showBackground(contexts, 1),
            background: showBackground(contexts, 0),
            child: ListTile(
              autofocus: true,
              contentPadding: EdgeInsets.all(10),
              leading: Checkbox(
                value: todos[index].completed,
                onChanged: (bool? value) {
                  log('ShowTodo: onChanged: $value');
                  context.read<TodoListCubit>().toggleTodo(todos[index].id);
                },
              ),
              title: Text(todos[index].desc),
              dense: true,
              minLeadingWidth: 20,
            ),
          );
        });
  }

  Widget showBackground(BuildContext context, int direction) {
    return Container(
      alignment: 0 == direction ? Alignment.centerLeft : Alignment.centerRight,
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Icon(Icons.delete),
    );
  }
}
