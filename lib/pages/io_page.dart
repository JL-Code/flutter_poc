import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

/// 引入path_provider库
/// [see] https://pub.dartlang.org/packages/path_provider#-installing-tab-
import 'package:path_provider/path_provider.dart';

/// TODO: 统计按钮点击次数(应用重启也不影响数据)
class IOPage extends StatefulWidget {
  @override
  _IOPageState createState() => _IOPageState();
}

class _IOPageState extends State<IOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter IO"),
      ),
      body: Text("io page"),
    );
  }
}
