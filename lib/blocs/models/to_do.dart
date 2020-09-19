import 'package:json_annotation/json_annotation.dart';

part 'to_do.g.dart';

@JsonSerializable()
class ToDo {
    ToDo();

    num userId;
    num id;
    String title;
    bool completed;
    
    factory ToDo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
    Map<String, dynamic> toJson() => _$TodoToJson(this);
}
