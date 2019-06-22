import 'package:flutter/material.dart';
import 'package:flutter_poc/helpers/appbar_builder.dart';

class FluroPage extends StatelessWidget {
  FluroPage({this.params});

  static const routeName = "/fluro";

  /// 路由参数
  final Map<String, List<String>> params;

  @override
  Widget build(BuildContext context) {
    // flutter 默认路由参数获取方法
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBarBuilder.create("FluroHome"),
      body: Center(
        child: Text("FluroPage $params"),
      ),
    );
  }
}
