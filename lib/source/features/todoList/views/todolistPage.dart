import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/source/features/todoList/logic/todoList_provider.dart';

class todoListPage extends StatelessWidget {
  const todoListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListWidget(),
      floatingActionButton: CosumerBottom(),
    );
  }
}

class ListWidget extends ConsumerStatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends ConsumerState<ListWidget> {
  @override
  void initState() {
    ref.read(stateListProvider.notifier).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stateListProvider);
    return Scaffold(
      body: state.when(
        initial: () {
          return const Center(child: Text("algo fue mal"));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (listmodel) {
          return ListView.builder(
            itemCount: listmodel.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listmodel[index].title),
                leading: IconButton(
                    onPressed: () {
                      ref.read(stateListProvider.notifier).RemoveData(index);
                    },
                    icon: const Icon(Icons.remove)),
              );
            },
          );
        },
        error: (error) {
          return Center(child: Text(error!));
        },
      ),
    );
  }
}

class CosumerBottom extends ConsumerWidget {
  const CosumerBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(stateListProvider.notifier).AddData();
      },
    );
  }
}
