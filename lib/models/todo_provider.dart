import 'package:consumo_api/models/todo_model.dart';
import 'package:consumo_api/repositories/datasources/todo_dio_datasource.dart';
import 'package:consumo_api/repositories/datasources/todo_http_datasource.dart';
import 'package:consumo_api/repositories/repository/todo_repository.dart';
import 'package:consumo_api/services/todo_service.dart';
import 'package:flutter/cupertino.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todoList = [];

  List<TodoModel> get todoList {
    return [..._todoList];
  }

  Future<void> getAllItems() async {
    _todoList = await GetItems().getAll();
    notifyListeners();
  }

  Future<void> getAllRepDio() async {
    _todoList =
        await TodoRepository(todoDatasource: TodoDioDatasource()).getAllItems();
    notifyListeners();
  }

  Future<void> getAllRepHttp() async {
    _todoList = await TodoRepository(todoDatasource: TodoHttpDatasource())
        .getAllItems();
    notifyListeners();
  }
}
