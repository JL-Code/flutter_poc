import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

/// 以 json_serializable 方式创建 model
/// 安装 json_serializable、build_runner、json_annotation
/// 具体依赖版本查看：https://github.com/dart-lang/json_serializable/blob/master/example/pubspec.yaml
/// https://pub.dev/packages/json_serializable#-example-tab-
///有两种运行代码生成器的方法：
//
//一次性生成
//通过在我们的项目根目录下运行flutter packages pub run build_runner build，我们可以在需要时为我们的model生成json序列化代码。 这触发了一次性构建，它通过我们的源文件，挑选相关的并为它们生成必要的序列化代码。
//
//虽然这非常方便，但如果我们不需要每次在model类中进行更改时都要手动运行构建命令的话会更好。
//
//持续生成
//使用_watcher_可以使我们的源代码生成的过程更加方便。它会监视我们项目中文件的变化，并在需要时自动构建必要的文件。我们可以通过flutter packages pub run
//build_runner watch在项目根目录下运行来启动_watcher_。
//
//只需启动一次观察器，然后并让它在后台运行，这是安全的。

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  ///如果需要，自定义命名策略也很容易。例如，如果我们正在使用的API返回带有_snake_case_的对象，但我们想在我们的模型中使用_lowerCamelCase_， 那么我们可以使用@JsonKey标注：
  /// Tell json_serializable that "registration_date_millis" should be
  /// mapped to this property.
//  @JsonKey(name: 'registration_date_millis')
//  final int registrationDateMillis;

  //不同的类使用不同的mixin即可
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
