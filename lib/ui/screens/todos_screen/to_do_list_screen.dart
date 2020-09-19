
import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/blocs/models/index.dart';
import 'package:flutter_kortobaa_test/blocs/providers/todo_view_model.dart';
import 'package:flutter_kortobaa_test/data/remote/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class ToDosScreen extends StatefulWidget {

  @override
  _ToDosScreenState createState() => _ToDosScreenState();
}

class _ToDosScreenState extends State<ToDosScreen> {
  var todoViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoViewModel = Provider.of<ToDoViewModel>(context,listen: false);
    todoViewModel.init();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ToDoViewModel>(
        builder: (context,todos,child){
          if (todos.todos==null) {
            return Center(
                child: CircularProgressIndicator()
            );
          }  else{
            return ListView.builder(
                itemCount: todos.todos.length,
                itemBuilder: (context,index)=>ListTile(
                  title: Text(todos.todos[index].id.toString()),
                  subtitle: Text(todos.todos[index].title),
                ));
          }
        },
      ),
    );
  }

}
