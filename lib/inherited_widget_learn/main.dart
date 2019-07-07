import 'package:flutter/material.dart';
import 'package:flutter_app/my_Inherited_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTree(),
    );
  }
}

class MyTree extends StatefulWidget {
  @override
  _MyTreeState createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    debugPrint("MyTree build");
    return MyInheritedWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text("myTree"),
        ),
        body: Column(
          children: <Widget>[
            WidgetA(),
            Container(
              child: Row(
                children: <Widget>[
                  WidgetB(),
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("build A");
    var state = MyInheritedWidget.of(context, rebuild: false);
    return Container(
      child: RaisedButton(
          child: Text("addItem"),
          onPressed: () {
            state.addItem("new item");
          }),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = MyInheritedWidget.of(context);
    debugPrint("build b");
    return Container(
      child: Text("B count:${state.count}"),
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("build C");
    return Container(
      child: Text("我是不变的WidgetC"),
    );
  }
}
