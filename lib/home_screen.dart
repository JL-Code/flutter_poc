import 'package:flutter/material.dart';
import 'helpers/appbar_builder.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.create("首页"),
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}
