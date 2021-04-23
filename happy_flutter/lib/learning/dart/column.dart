import 'package:json_annotation/json_annotation.dart';

part 'column.g.dart';

@JsonSerializable()
class CmsColumn {
  String name;
  String key;
  int id;

  CmsColumn(this.id, this.name, this.key);

  factory CmsColumn.fromJson(Map<String, dynamic> json) => _$CmsColumnFromJson(json);
  Map<String, dynamic> toJson() => _$CmsColumnToJson(this);
}
