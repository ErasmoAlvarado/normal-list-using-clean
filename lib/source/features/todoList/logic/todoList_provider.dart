import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/source/features/todoList/data/repositories/todoList_repositories.dart';
import 'package:todo_list/source/features/todoList/logic/todoList_notifier.dart';
import 'package:todo_list/source/features/todoList/logic/todoList_state.dart';

final todoListProvider = Provider<todolistRespository>((ref) {
  return todolistRespository();
});

final stateListProvider = StateNotifierProvider<Notifier, todoListState>((ref) {
  return Notifier(respository: ref.watch(todoListProvider));
});
