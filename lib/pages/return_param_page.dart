import 'package:flutter/material.dart';

import '../application.dart';

/// 返回参数测试页面
class ReturnParamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("返回参数测试页面"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("返回 bool "),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, 12);
              },
              child: Text("返回 number "),
            ),
          ],
        ),
      ),
    );
  }
}
