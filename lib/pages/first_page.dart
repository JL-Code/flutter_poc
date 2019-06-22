import 'package:flutter/material.dart';

import '../application.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  static const String routeName = "/firstPage";

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
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
                    .then((data) {
                  print("result: $data");
                });
              },
              child: Text("有参数返回的页面"),
            ),
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(
                    context, Routes.fluro + "?string=aa&bool=false&num=12");
              },
              child: Text("简单类型参数传参(stirng,boolean,number)"),
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
