
/// 非嵌套类型
/// 手动序列化JSON
class GoodsCount {
  final int errno;
  final int data;
  final String errmsg;

  GoodsCount(this.errno, this.data, this.errmsg);

  GoodsCount.fromJson(Map<String, dynamic> json)
      : errno = json['errno'],
        data = json['data'],
        errmsg = json['errmsg'];

  /// 转JSON
  Map<String, dynamic> toJson() => {
        'errno': errno,
        'data': data,
        'errmsg': errmsg,
      };
}


