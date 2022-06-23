import 'package:flutter/material.dart';
import 'package:todo_list/source/features/todoList/views/todolistPage.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: todoListPage(),
    );
  }
}
