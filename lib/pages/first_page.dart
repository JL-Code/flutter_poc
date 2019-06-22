import 'dart:convert';

import 'package:flutter/material.dart';

import '../application.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key key}) : super(key: key);
  static const String routeName = "/firstPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.home);
              },
              child: Text("主页"),
            ),
            RaisedButton(
              onPressed: () {
                Application.router
                    .navigateTo(context, Routes.returnParamPage)
                    .then((Object data) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        // 判断data的类型
                        return SimpleDialog(
                          title: const Text("标题"),
                          children: <Widget>[
                            Center(
                              child: Text('${data.toString()}'),
                            ),
                          ],
                        );
                      });
                });
              },
              child: Text("有参数返回的页面"),
            ),
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(
                    context, Routes.fluro + "?string=aa&bool=false&num=12");
              },
              child: Text("url传递简单类型参数(stirng,boolean,number)"),
            ),
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(context,
                    "${Routes.fluro}?cn=${Uri.encodeComponent("中国")}&city=${Uri.encodeComponent("重庆")}");
              },
              child: Text("fluro 传递中文参数"),
            ),
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.fluro);
              },
              child: Text("复杂类型传参"),
            ),
          ],
        ),
      ),
    );
  }
}
