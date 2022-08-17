import 'package:consumo_api/repositories/datasources/todo_datasource.dart';
import 'package:dio/dio.dart';

class TodoDioDatasource implements TodoDatasource {
  Dio dio = Dio();

  @override
  Future<List<dynamic>> getAll() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');
    return response.data;
  }
}
