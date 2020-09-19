
import 'package:flutter_kortobaa_test/blocs/models/to_do.dart';

abstract class IToDoRepository{

  Future<List<ToDo>> getAllToDos();
}