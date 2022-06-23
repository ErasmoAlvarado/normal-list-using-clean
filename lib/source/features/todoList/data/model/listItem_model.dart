import 'package:equatable/equatable.dart';

class listItem_model extends Equatable {
  String title;
  listItem_model({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}
