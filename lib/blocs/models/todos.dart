import 'package:json_annotation/json_annotation.dart';
import "todo.dart";
part 'todos.g.dart';

@JsonSerializable()
class Todos {
    Todos();

    List<Todo> todos;
    
    factory Todos.fromJson(Map<String,dynamic> json) => _$TodosFromJson(json);
    Map<String, dynamic> toJson() => _$TodosToJson(this);
}
