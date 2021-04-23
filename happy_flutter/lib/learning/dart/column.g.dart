// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmsColumn _$CmsColumnFromJson(Map<String, dynamic> json) {
  return CmsColumn(
    json['id'] as int,
    json['name'] as String,
    json['key'] as String,
  );
}

Map<String, dynamic> _$CmsColumnToJson(CmsColumn instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'id': instance.id,
    };
