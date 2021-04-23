// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmsContent _$CmsContentFromJson(Map<String, dynamic> json) {
  return CmsContent(
    json['title'] as String,
    json['column_name'] as String,
    (json['thumbnail_urls'] as List)?.map((e) => e as String)?.toList(),
    json['list_item_mode'] as int,
  )
    ..source = json['source'] as String
    ..authorNickname = json['author_nickname'] as String;
}

Map<String, dynamic> _$CmsContentToJson(CmsContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'source': instance.source,
      'column_name': instance.columnName,
      'thumbnail_urls': instance.thumbnailUrls,
      'list_item_mode': instance.listTtemMode,
      'author_nickname': instance.authorNickname,
    };
