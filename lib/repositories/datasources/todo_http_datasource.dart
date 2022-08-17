import 'dart:convert';

import 'package:consumo_api/repositories/datasources/todo_datasource.dart';
import 'package:http/http.dart' as http;

class TodoHttpDatasource implements TodoDatasource {
  @override
  Future<List<dynamic>> getAll() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    return jsonDecode(response.body);
  }
}
