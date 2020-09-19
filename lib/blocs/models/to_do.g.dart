// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$TodoFromJson(Map<String, dynamic> json) {
  return ToDo()
    ..userId = json['userId'] as num
    ..id = json['id'] as num
    ..title = json['title'] as String
    ..completed = json['completed'] as bool;
}

Map<String, dynamic> _$TodoToJson(ToDo instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed
    };
