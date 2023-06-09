import 'package:flutter/material.dart';
import 'package:todo_cubit/pages/todos_page/create_todo.dart';
import 'package:todo_cubit/pages/todos_page/search_and_filter_todo.dart';
import 'package:todo_cubit/pages/todos_page/show_todo.dart';
import 'package:todo_cubit/pages/todos_page/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            children: [
              TodoHeader(),
              CreateTodo(),
              SizedBox(
                height: 20,
              ),
              SeacrhAndFilterTodo(),
              ShowTodo()
            ],
          ),
        ),
      )),
    );
  }
}
