import 'dart:async';

import 'package:flutter/material.dart';
import './number_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberManagerWidget(
        child: Scaffold(
          appBar: AppBar(
            title: Text("NumberManagerWidget"),
          ),
          body: Column(
            children: <Widget>[
              InheritedModelView(type: NUMBER_TYPE.FIRST),
              InheritedModelView(type: NUMBER_TYPE.SECOND),
              InheritedModelView(type: NUMBER_TYPE.THIRD),
              // InheritedModelViewMulti(
              //   types: [NUMBER_TYPE.SECOND, NUMBER_TYPE.THIRD],
              // ),
              // SizedBox(height: 15),
//              InheritedWidgetView(type: NUMBER_TYPE.FIRST),
//              InheritedWidgetView(type: NUMBER_TYPE.SECOND),
//              InheritedWidgetView(type: NUMBER_TYPE.THIRD)
            ],
          ),
        ),
      ),
    );
  }
}

class NumberManagerWidget extends StatefulWidget {
  final Widget child;

  NumberManagerWidget({@required this.child});

  @override
  _NumberManagerWidgetState createState() => _NumberManagerWidgetState();
}

class _NumberManagerWidgetState extends State<NumberManagerWidget> {
  int firstTick, secondTick, thirdTick;
  Timer updateTimer;

  void resetTimer() {
    updateTimer?.cancel();
    updateTimer = Timer.periodic(
      Duration(milliseconds: 1000),
      (Timer t) {
        setState(() {
          firstTick++;
          if (firstTick % 2 == 0) {
            secondTick++;
            if (secondTick % 2 == 0) {
              thirdTick++;
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    firstTick = secondTick = thirdTick = 0;
    resetTimer();
  }

  @override
  void dispose() {
    updateTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(NumberManagerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return NumberModel(
      firstValue: firstTick,
      secondValue: secondTick,
      thirdValue: thirdTick,
      child: widget.child,
    );
  }
}
