import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

///A Flutter plugin for finding commonly used locations on the filesystem. Supports iOS and Android.
/// [see] https://pub.dartlang.org/packages/path_provider#-installing-tab-
import 'package:path_provider/path_provider.dart';

/// TODO: 统计按钮点击次数(应用重启也不影响数据)
class IOPage extends StatefulWidget {
  @override
  _IOPageState createState() => _IOPageState();
}

class _IOPageState extends State<IOPage> {
  int _counter = 0;
  String _filePath;

  @override
  void initState() {
    // 读取本地文件中的计数数据
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  /// 读取本地文件中的计数
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  /// 读取本地文件
  Future<File> _getLocalFile() async {
    ///
    /// ```dart
    /// Directory tempDir = await getTemporaryDirectory();
    /// String tempPath = tempDir.path;
    ///
    /// Directory appDocDir = await getApplicationDocumentsDirectory();
    /// String appDocPath = appDocDir.path;
    /// ```
    Directory dir = await getApplicationDocumentsDirectory();
    _filePath = dir.path;
    return new File('${dir.path}/counter.txt');
  }

  /// 自动增加计数
  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // write the variable as a string to the file
    File file = await _getLocalFile();

    /// TODO: 加 await 和不加 await 有什么区别？
    file.writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter IO"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("count:$_counter"),
            Text("filePath:$_filePath"),
            RaisedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text("计数"),
            ),
          ],
        ),
      ),
    );
  }
}
