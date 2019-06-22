import 'package:flutter/material.dart';
import 'package:flutter_poc/helpers/appbar_builder.dart';

class FluroPage extends StatelessWidget {
  static const routeName = "/fluro";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBarBuilder.create("FluroHome"),
      body: Center(
        child: Text("FluroPage"),
      ),
    );
  }
}
