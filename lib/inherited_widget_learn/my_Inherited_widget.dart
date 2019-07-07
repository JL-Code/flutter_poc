import 'package:flutter/material.dart';

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({this.child});

  final Widget child;

  @override
  MyInheritedWidgetState createState() => MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context,
      {bool rebuild = true}) {
    var widget = (rebuild
        ? context.inheritFromWidgetOfExactType(_MyInherited)
        : context.ancestorWidgetOfExactType(_MyInherited)) as _MyInherited;
    return widget.state;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  List<String> _goods = [];

  int get count => _goods.length;

  void addItem(String name) {
    setState(() {
      _goods.add(name);
    });
  }

  /// 当 setState 调用后 framework 会在后续调用 build
  @override
  Widget build(BuildContext context) {
    debugPrint("MyInheritedWidget build");
    return _MyInherited(
      child: widget.child,
      state: this,
    );
  }

  /// 用于添加订阅者并返回 state 实例

}

/// 利用InheritedWidget 内部的发布订阅模式 分发状态更新通知
class _MyInherited extends InheritedWidget {
  _MyInherited({Key key, this.child, this.state})
      : super(key: key, child: child) {
    debugPrint("_MyInherited ctor");
  }

  final Widget child;
  final MyInheritedWidgetState state;

  /// 是否应该通知订阅者（widget）更新
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
