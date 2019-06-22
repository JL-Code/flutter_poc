import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/home_screen.dart';
import 'package:flutter_poc/pages/first_page.dart';
import 'package:flutter_poc/pages/fluro_home.dart';
import 'package:flutter_poc/pages/return_param_page.dart';

/// 跳转到首页
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new FirstPage();
});

/// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

var fluroHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    debugPrint("fluroHandler params:$params");
    return FluroPage(
      params: params,
    );
  },
);

var returnParamPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  debugPrint("returnParamPageHandler params:$params");
  return ReturnParamPage();
});
