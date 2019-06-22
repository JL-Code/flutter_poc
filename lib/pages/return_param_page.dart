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
            /// 简单类型
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

            /// 复杂类型
            RaisedButton(
              onPressed: () {
                List<String> list = ["jiangy", "wanglinling"];
                Navigator.pop(context, list);
              },
              child: Text("返回 List "),
            ),
            RaisedButton(
              onPressed: () {
                Map<String, List<Object>> map = {
                  "name": [11, 22],
                  "hobby": ["足球", "篮球", "羽毛球"]
                };
                Navigator.pop(context, map);
              },
              child: Text("返回 Map "),
            ),
            RaisedButton(
              onPressed: () {
                var person = Person(name: "jiangy", age: 1);
                debugPrint(person.toString());
                Navigator.pop(context, person);
              },
              child: Text("返回 自定义类型 Person "),
            ),
          ],
        ),
      ),
    );
  }
}

/// 人
class Person {
  Person({this.name, this.age});

  final String name;
  final int age;

  @override
  String toString() {
    // TODO: implement toString
    return "{name:${this.name},age:${this.age}}";
  }
}
