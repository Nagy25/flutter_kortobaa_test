import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
    Todo();

    num userId;
    num id;
    String title;
    bool completed;
    
    factory Todo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
    Map<String, dynamic> toJson() => _$TodoToJson(this);
}
