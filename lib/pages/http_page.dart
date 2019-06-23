import 'package:flutter/material.dart';

/// https://github.com/flutterchina/dio/blob/master/README-ZH.md
/// dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器
import 'package:dio/dio.dart';
import 'package:flutter_poc/models/goods_count.dart';
import 'package:flutter_poc/models/goods_detail.dart';

/// TODO: 统计按钮点击次数(应用重启也不影响数据)
class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  GoodsDetail _response;
  GoodsCount _goodsCount;

  @override
  void initState() {
    // 读取本地文件中的计数数据
    super.initState();
  }

  /// 模拟请求
  Future<dynamic> _mockRequest() {
    var url = "https://www.menethil.com.cn/wx/goods/detail?id=1181014";
    return Dio().get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio 库使用"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("_response:${_response?.toJson()}"),
              Text("_goodsCount:${_goodsCount?.toJson()}"),
              RaisedButton(
                onPressed: () {
                  var url =
                      "https://www.menethil.com.cn/wx/goods/detail?id=1181014";
                  Dio().get<Map<String, dynamic>>(url).then((res) {
                    print(res);
                    var goodsDetail = GoodsDetail.fromJson(res.data);
                    setState(() {
                      _response = goodsDetail;
                    });
                  });
                },
                child: Text("GET请求 响应复杂嵌套类型JSON数据"),
              ),
              RaisedButton(
                onPressed: () {
                  var url = "https://www.menethil.com.cn/wx/cart/goodscount";
                  Dio().get<Map<String, dynamic>>(url).then((res) {
                    print(res);
                    var goodsCount = GoodsCount.fromJson(res.data);
                    setState(() {
                      _goodsCount = goodsCount;
                    });
                  });
                },
                child: Text("GET请求 手动序列化JSON"),
              ),
              RaisedButton(
                onPressed: () {
                  var url = "https://www.menethil.com.cn/wx/cart/fastadd";

                  /// post data:dynamic
                  Dio().post<Map<String, dynamic>>(url, data: {
                    "goodsId": 1181018,
                    "number": 1,
                    "productId": 486
                  }).then((res) {
                    print(res);
                    var goodsCount = GoodsCount.fromJson(res.data);
                    setState(() {
                      _goodsCount = goodsCount;
                    });
                  });
                },
                child: Text("POST请求 手动序列化JSON"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _response = null;
                    _goodsCount = null;
                  });
                },
                child: Text("清空"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
