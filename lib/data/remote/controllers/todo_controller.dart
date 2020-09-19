import 'package:flutter_kortobaa_test/blocs/models/to_do.dart';
import 'package:flutter_kortobaa_test/data/remote/interfaces/i_todo_repository.dart';
import 'package:flutter_kortobaa_test/data/remote/interfaces/todo_repository.dart';
import 'package:dio/dio.dart';


class ToDoController{
  final IToDoRepository _todoRepository = ToDoRepository(Dio());

  Future<List<ToDo>> fetchToDos(){
    return _todoRepository.getAllToDos();
  }

}