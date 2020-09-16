// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map<String, dynamic> json) {
  return Todos()
    ..todos = (json['todos'] as List)
        ?.map(
            (e) => e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TodosToJson(Todos instance) =>
    <String, dynamic>{'todos': instance.todos};
