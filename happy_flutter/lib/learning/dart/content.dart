import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class CmsContent {
  String title;
  String source;

  @JsonKey(name: 'column_name')
  String columnName;

  @JsonKey(name: 'thumbnail_urls')
  List<String> thumbnailUrls;

  @JsonKey(name: 'list_item_mode')
  int listTtemMode;

  @JsonKey(name: 'author_nickname')
  String authorNickname;

  CmsContent(this.title, this.columnName, this.thumbnailUrls, this.listTtemMode);

  factory CmsContent.fromJson(Map<String, dynamic> json) => _$CmsContentFromJson(json);
  Map<String, dynamic> toJson() => _$CmsContentToJson(this);
}