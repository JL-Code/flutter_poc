import 'package:flutter/material.dart';

class AppBarBuilder {
  static Widget create(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
