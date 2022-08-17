import 'package:consumo_api/models/todo_model.dart';
import 'package:dio/dio.dart';

class GetItems {
  Dio dio = Dio();

  Future<List<TodoModel>> getAll() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');
    final List<TodoModel> list = (response.data as List).map((item) {
      return TodoModel.fromJson(item);
    }).toList();
    return list;
  }
}
