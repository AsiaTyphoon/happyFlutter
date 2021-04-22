// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicSetting _$PublicSettingFromJson(Map<String, dynamic> json) {
  return PublicSetting(
    json['name'] as String,
    json['password_error_msg'] as String,
    json['mweb'] == null
        ? null
        : MWeb.fromJson(json['mweb'] as Map<String, dynamic>),
  )..api = (json['api'] as List)
      ?.map((e) => e == null ? null : MWeb.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$PublicSettingToJson(PublicSetting instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password_error_msg': instance.passwordErrorMsg,
      'mweb': instance.mweb,
      'api': instance.api,
    };
