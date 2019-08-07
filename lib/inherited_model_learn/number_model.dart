import 'package:flutter/material.dart';

/// [NUMBER_TYPE] 是 InheritedModel<T> aspect 的类型
class NumberModel extends InheritedModel<NUMBER_TYPE> {
  NumberModel({
    @required this.firstValue,
    @required this.secondValue,
    @required this.thirdValue,
    @required Widget child,
  }) : super(child: child);

  final int firstValue, secondValue, thirdValue;

  /// 是否应该通知订阅者更新
  @override
  bool updateShouldNotify(NumberModel old) {
    return firstValue != old.firstValue ||
        secondValue != old.secondValue ||
        thirdValue != old.thirdValue;
  }

  /// 是否应该通知订阅者依赖
  @override
  bool updateShouldNotifyDependent(NumberModel old, Set<NUMBER_TYPE> aspects) {
    /// 当 model 状态更新时framework会调用updateShouldNotifyDependent方法同时会传入一个 aspect Set集合
    return (aspects.contains(NUMBER_TYPE.FIRST) &&
            firstValue != old.firstValue) ||
        (aspects.contains(NUMBER_TYPE.SECOND) &&
            secondValue != old.secondValue) ||
        (aspects.contains(NUMBER_TYPE.THIRD) && thirdValue != old.thirdValue);
  }

  static NumberModel of(BuildContext context, {NUMBER_TYPE aspect}) {
    var model =
        InheritedModel.inheritFrom<NumberModel>(context, aspect: aspect);
    return model;
  }

  Widget getLabeledText(NUMBER_TYPE type) {
    switch (type) {
      case NUMBER_TYPE.FIRST:
        return Text('First Number: $firstValue');
      case NUMBER_TYPE.SECOND:
        return Text('Second Number: $secondValue');
      case NUMBER_TYPE.THIRD:
        return Text('Third Number: $thirdValue');
    }
    return Text('Unknown Number Type $type');
  }
}

/// 数据类型
enum NUMBER_TYPE { FIRST, SECOND, THIRD }

/// 构建颜色序列
class _ColorRegistry {
  final List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  int _idx = 0;

  Color nextColor() {
    if (_idx >= colors.length) {
      _idx = 0;
    }
    return colors[_idx++];
  }
}

class InheritedModelView extends StatelessWidget {
  final NUMBER_TYPE type;
  final _ColorRegistry r = _ColorRegistry();

  InheritedModelView({this.type});

  @override
  Widget build(BuildContext context) {
    var model = NumberModel.of(context, aspect: type);
    return Container(
      color: r.nextColor(),
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          model.getLabeledText(type),
        ],
      ),
    );
  }
}

class InheritedModelViewMulti extends StatelessWidget {
  final List<NUMBER_TYPE> types;
  final _ColorRegistry r = _ColorRegistry();

  InheritedModelViewMulti({this.types});

  @override
  Widget build(BuildContext context) {
    var model0 = NumberModel.of(context, aspect: types[0]);
    var model1 = NumberModel.of(context, aspect: types[1]);
    return Container(
      color: r.nextColor(),
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          model0.getLabeledText(types[0]),
          model1.getLabeledText(types[1])
        ],
      ),
    );
  }
}

class InheritedWidgetView extends StatelessWidget {
  final NUMBER_TYPE type;
  final _ColorRegistry r = _ColorRegistry();

  InheritedWidgetView({this.type});

  @override
  Widget build(BuildContext context) {
    var view = NumberModel.of(context);
    return Container(
      color: r.nextColor(),
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          view.getLabeledText(type),
        ],
      ),
    );
  }
}
