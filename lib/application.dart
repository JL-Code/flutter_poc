import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'fluro/route_handler.dart';

/**
 * 1.获取package fluro
 * 2.定义路由及处理函数
 * 3.在MaterialApp进行路由注册
 */

/// 应用程序
class Application {
  /// 路由器
  static Router router;
}

/// 路由集合
class Routes {
  /// TODO: 路由与路由处理函数是否做成动态？
  static String root = "/";
  static String home = "/home";
  static String fluro = "/fluro";
  static String returnParamPage = "/returnParamPage";
  static String io = "/io";
  static String http = "/http";

  static void configureRoutes(Router router) {
    /// 设置在未找到路由时的处理函数
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
    /// 我这边先不设置默认的转场动画，转场动画在下面会讲，可以在另外一个地方设置（可以看NavigatorUtil类）
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(fluro, handler: fluroHandler);
    router.define(returnParamPage, handler: returnParamPageHandler);
    router.define(io, handler: ioHandler);
    router.define(http, handler: httpHandler);
//    router.define(demoParams, handler: demoParamHandler);
//    router.define(returnParams, handler: returnParamHandler);
//    router.define(transitionDemo, handler: transitionDemoHandler);
//    router.define(transitionCustomDemo, handler: transitionDemoHandler);
//    router.define(transitionCupertinoDemo, handler: transitionDemoHandler);
  }
}
