import 'package:todo_list/source/features/todoList/data/model/listItem_model.dart';

class todolistRespository {
  List<listItem_model> data = [listItem_model(title: 'primer dato')];

  @override
  List<listItem_model> getdata() {
    return data;
  }

  @override
  List<listItem_model> addData(listItem_model item) {
    data.add(item);
    return data;
  }

  @override
  List<listItem_model> removeData(int index) {
    data.removeAt(index);
    return data;
  }
}
