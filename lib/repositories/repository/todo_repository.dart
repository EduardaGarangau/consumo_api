import 'package:consumo_api/models/todo_model.dart';
import 'package:consumo_api/repositories/datasources/todo_datasource.dart';

class TodoRepository {
  final TodoDatasource todoDatasource;

  TodoRepository({required this.todoDatasource});

  Future<List<TodoModel>> getAllItems() async {
    final json = await todoDatasource.getAll();
    return json.map((item) => TodoModel.fromJson(item)).toList();
  }
}
