import 'package:json_annotation/json_annotation.dart';

part 'mweb.g.dart';

@JsonSerializable()
class MWeb {
  String key;

  @JsonKey(name: 'base_url')
  String baseUrl;

  MWeb(this.key, this.baseUrl);

  factory MWeb.fromJson(Map<String, dynamic> json) => _$MWebFromJson(json);
  Map<String, dynamic> toJson() => _$MWebToJson(this);
}
