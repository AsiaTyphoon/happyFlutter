// 1.import 导入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'mweb.dart';

//https://www.jianshu.com/p/976f02f4f933
//https://www.jianshu.com/p/ddfdde57d9e0

// 2.public_setting.g.dart 将在我们运行生成命令后json_serializable帮我们自动生成.g.dart文件，在未执行命令前该行可能会报错
part 'public_setting.g.dart';

// 3.这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class PublicSetting {
  String name;

  //显式关联JSON字段名与Model属性的对应关系,
  // 如下将属性appCopyright和app_copyright字段关联
  @JsonKey(name: 'password_error_msg')
  String passwordErrorMsg;

  MWeb mweb;

  List<MWeb> api;

  // 4.必须的构造方法
  PublicSetting(this.name, this.passwordErrorMsg, this.mweb);

  // 5.必须有的对应工厂构造器
  factory PublicSetting.fromJson(Map<String, dynamic> json) => _$PublicSettingFromJson(json);
  Map<String, dynamic> toJson() => _$PublicSettingToJson(this);

  // 这里 toString方法不是必须的, 只是用测试数据
  @override
  String toString() {
    return 'PublicSetting{name: $name, passwordErrorMsg: $passwordErrorMsg}';
  }
}
