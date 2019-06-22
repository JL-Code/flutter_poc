import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/pages/first_page.dart';
import 'package:flutter_poc/pages/second_page.dart';
import 'package:flutter_poc/pages/generate_route_page.dart';
import 'package:flutter_poc/pages/fluro_home.dart';
import 'package:flutter_poc/application.dart' show Routes, Application;

void main() {
  // 注册 fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 该标题出现在 Android：任务管理器的程序快照之上 IOS: 程序切换管理器中
      title: 'Flutter POC',
      theme: ThemeData.light(),

      /// 初始路由
      initialRoute: "/",
//      routes: {
//        FirstPage.routeName: (context) => FirstPage(),
//        SecondPage.routeName: (context) => SecondPage(),
//        FluroPage.routeName: (context) => FluroPage()
//      },

      /// 当在routers中没有找到route时调用此回调函数。
//      onGenerateRoute: (RouteSettings settings) {
//        debugPrint("onGenerateRoute ${DateTime.now()}");
//        return MaterialPageRoute(builder: (BuildContext context) {
//          return GenerateRoutePage();
//        });
//      },
      /// 由 fluro 接管 generateRoute处理函数
      onGenerateRoute: Application.router.generator,

      /// 如果为非null，则调用此回调函数以生成应用程序的标题字符串，否则使用页面自带标题。(任务管理器上显示的名称)
      onGenerateTitle: (BuildContext context) {
        debugPrint("onGenerateTitle ${DateTime.now()}");
        return "onGenerateTitle";
      },

      /// 当在routers中没有找到route时调用此回调函数。 【效果跟onGenerateRoute一样 调用顺序为onGenerateRoute ==> onUnknownRoute】
      onUnknownRoute: (RouteSettings settings) {
        debugPrint("onUnknownRoute ${DateTime.now()}");
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("404"),
            ),
            body: Center(
              child: Text("NOT Found"),
            ),
          );
        });
      },

      /// 导航监听
      navigatorObservers: [MyObserver()],
//      home: Scaffold(
//        appBar: new AppBar(
//          title: new Text('Route&Navigator 学习'),
//        ),
//        body: Builder(
//          builder: (BuildContext context) {
//            return ListView(
//              children: <Widget>[
//                ListTile(
//                  title: Text("通过命名路由，进入First Page"),
//                  onTap: () async {
//                    var result = await Navigator.pushNamed(
//                        context, FirstPage.routeName,
//                        arguments: "home arg1");
//                    debugPrint(result);
//                  },
//                ),
//                Divider(
//                  height: 0.5,
//                ),
//                ListTile(
//                  title: Text("通过MaterialPageRoute进入Second Page"),
//                  onTap: () async {
//                    var result = await Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) {
//                          return SecondPage();
//                        },
//                        fullscreenDialog: false,
//                        settings: RouteSettings(
//                          arguments: "second",
//                          isInitialRoute: false,
//                        ),
//                      ),
//                    );
//                    debugPrint(result);
//                  },
//                ),
//                Divider(
//                  height: 0.5,
//                ),
//                ListTile(
//                  title: Text("进入一个不存在的Page"),
//                  onTap: () {
//                    Navigator.pushNamed(context, "routeName");
//                  },
//                ),
//                Divider(
//                  height: 0.5,
//                ),
//                ListTile(
//                  title: Text("自定义路由切换动画，进入Second Page"),
//                  onTap: () async {
//                    var result = await Navigator.push(
//                      context,
//                      PageRouteBuilder(
//
//                          ///动画时间 （默认300）
//                          transitionDuration: Duration(milliseconds: 300),
//
//                          /// 页面构建器
//                          pageBuilder: (BuildContext context,
//                              Animation<double> animation,
//                              Animation<double> secondaryAnimation) {
//                            ///
//                            return SlideTransition(
//                              /// Tween 渐变动画
//                              position: Tween<Offset>(
//                                begin: const Offset(1.0, 0.0),
//                                end: const Offset(0.0, 0.0),
//                              ).animate(animation),
//                              child: SecondPage(),
//                            );
//                          }),
//                    );
//                    debugPrint(result);
//                  },
//                ),
//                Divider(
//                  height: 0.5,
//                ),
//                ListTile(
//                  title: Text("企业级路由 Fluro"),
//                  onTap: () async {
//                    var result =
//                        await Navigator.pushNamed(context, FluroPage.routeName);
//                    debugPrint(result);
//                  },
//                ),
//              ],
//            );
//          },
//        ),
//      ),
    );
  }
}

/// 继承NavigatorObserver
class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    //....等等

    print("route.settings.name: ${route.settings.name}");
    debugPrint("route.settings.arguments: ${route.settings.arguments}");
  }
}
