import 'package:flutter/cupertino.dart';
import 'package:flutter_kortobaa_test/blocs/models/to_do.dart';
import 'package:flutter_kortobaa_test/data/remote/apis/todo_repository.dart';
import 'package:flutter_kortobaa_test/data/remote/controllers/todo_controller.dart';

class ToDoViewModel extends ChangeNotifier{


  ToDoViewModel();

  List<ToDo> todos ;

  init() async{
    print("init");
    ToDoController _toDoController = ToDoController();
    todos = await _toDoController.fetchToDos();
    notifyListeners();
    print("end");
  }
}