
import 'package:flutter_kortobaa_test/blocs/models/to_do.dart';
import 'package:flutter_kortobaa_test/data/remote/interfaces/i_todo_repository.dart';
import 'package:dio/dio.dart';

class ToDoRepository implements IToDoRepository{

  final Dio _dio;

  ToDoRepository(this._dio);

  @override
  Future<List<ToDo>> getAllToDos()  async{
    List<ToDo> todos = [];
     var response = await  _dio.get("https://jsonplaceholder.typicode.com/todos");

     response.data.map((todo){
       todos.add(ToDo.fromJson(todo));
     }).toList();

     return todos;
  }

}