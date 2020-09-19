import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/blocs/models/index.dart';
import 'package:flutter_kortobaa_test/data/remote/controllers/todo_controller.dart';

class ToDosScreen extends StatelessWidget {

  ToDoController _toDoController = ToDoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<ToDo>>(
        future: _toDoController.fetchToDos(),
        builder: (context,snapshot){
          var todos = snapshot.data;
          if (todos==null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(
                itemCount:  todos.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(todos[index].id.toString()),
                    subtitle: Text(todos[index].title),
                  );
                }
            );
          }
        },
      ),
    );
  }
}
