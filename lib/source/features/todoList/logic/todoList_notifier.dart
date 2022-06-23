import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/source/features/todoList/data/model/listItem_model.dart';
import 'package:todo_list/source/features/todoList/data/repositories/todoList_repositories.dart';
import 'package:todo_list/source/features/todoList/logic/todoList_state.dart';

class Notifier extends StateNotifier<todoListState> {
  Notifier({required todolistRespository respository})
      : respository_ = respository,
        super(const todoListState.initial());

  final todolistRespository respository_;

  void getData() {
    try {
      final data = respository_.getdata();
      state = todoListState.data(listmodel: data);
    } catch (e) {
      throw ('something goes wrong $e');
    }
  }

  void AddData() {
    state = const todoListState.loading();
    try {
      final data =
          respository_.addData(listItem_model(title: "hola como esta"));
      state = todoListState.data(listmodel: data);
    } catch (e) {
      throw ('someting goes wrong');
    }
  }

  void RemoveData(int index) {
    state = const todoListState.loading();
    try {
      final data = respository_.removeData(index);
      state = todoListState.data(listmodel: data);
    } catch (e) {
      state = const todoListState.error('algo fue mal que mal noonooononono');
      throw ('something goes wrong');
    }
  }
}
