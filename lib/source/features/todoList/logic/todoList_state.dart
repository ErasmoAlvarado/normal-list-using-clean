import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/source/features/todoList/data/model/listItem_model.dart';
part 'todoList_state.freezed.dart';

@freezed
abstract class todoListState with _$todoListState {
  const factory todoListState.initial() = _todoListStateInitial;

  const factory todoListState.loading() = _todoListStateLoading;

  const factory todoListState.data({required List<listItem_model> listmodel}) =
      _todoListStateData;

  const factory todoListState.error([String? error]) = _todoListStateError;
}
