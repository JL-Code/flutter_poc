/// 根据JSON格式自动生成的Dart类
/// https://javiercbk.github.io/json_to_dart/
class GoodsDetail {
  int errno;
  Data data;
  String errmsg;

  GoodsDetail({this.errno, this.data, this.errmsg});

  GoodsDetail.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errmsg = json['errmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['errmsg'] = this.errmsg;
    return data;
  }
}

class Data {
  List<SpecificationList> specificationList;
  List<Issue> issue;
  int userHasCollect;
  String shareImage;
  Comment comment;
  List<Attribute> attribute;
  Brand brand;
  List<ProductList> productList;
  Info info;

  Data(
      {this.specificationList,
      this.issue,
      this.userHasCollect,
      this.shareImage,
      this.comment,
      this.attribute,
      this.brand,
      this.productList,
      this.info});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['specificationList'] != null) {
      specificationList = new List<SpecificationList>();
      json['specificationList'].forEach((v) {
        specificationList.add(new SpecificationList.fromJson(v));
      });
    }
    if (json['issue'] != null) {
      issue = new List<Issue>();
      json['issue'].forEach((v) {
        issue.add(new Issue.fromJson(v));
      });
    }
    userHasCollect = json['userHasCollect'];
    shareImage = json['shareImage'];
    comment =
        json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
    if (json['attribute'] != null) {
      attribute = new List<Attribute>();
      json['attribute'].forEach((v) {
        attribute.add(new Attribute.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['productList'] != null) {
      productList = new List<ProductList>();
      json['productList'].forEach((v) {
        productList.add(new ProductList.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specificationList != null) {
      data['specificationList'] =
          this.specificationList.map((v) => v.toJson()).toList();
    }
    if (this.issue != null) {
      data['issue'] = this.issue.map((v) => v.toJson()).toList();
    }
    data['userHasCollect'] = this.userHasCollect;
    data['shareImage'] = this.shareImage;
    if (this.comment != null) {
      data['comment'] = this.comment.toJson();
    }
    if (this.attribute != null) {
      data['attribute'] = this.attribute.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    if (this.productList != null) {
      data['productList'] = this.productList.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class SpecificationList {
  String name;
  List<ValueList> valueList;

  SpecificationList({this.name, this.valueList});

  SpecificationList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['valueList'] != null) {
      valueList = new List<ValueList>();
      json['valueList'].forEach((v) {
        valueList.add(new ValueList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.valueList != null) {
      data['valueList'] = this.valueList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ValueList {
  int id;
  int goodsId;
  String specification;
  String value;
  String picUrl;
  String addTime;
  bool deleted;
  int version;

  ValueList(
      {this.id,
      this.goodsId,
      this.specification,
      this.value,
      this.picUrl,
      this.addTime,
      this.deleted,
      this.version});

  ValueList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    specification = json['specification'];
    value = json['value'];
    picUrl = json['picUrl'];
    addTime = json['addTime'];
    deleted = json['deleted'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['specification'] = this.specification;
    data['value'] = this.value;
    data['picUrl'] = this.picUrl;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    data['version'] = this.version;
    return data;
  }
}

class Issue {
  int id;
  String question;
  String answer;
  String addTime;
  bool deleted;
  int version;

  Issue(
      {this.id,
      this.question,
      this.answer,
      this.addTime,
      this.deleted,
      this.version});

  Issue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    addTime = json['addTime'];
    deleted = json['deleted'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    data['version'] = this.version;
    return data;
  }
}

class Comment {
  int count;

  Comment({this.count});

  Comment.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Attribute {
  int id;
  int goodsId;
  String attribute;
  String value;
  String addTime;
  bool deleted;

  Attribute(
      {this.id,
      this.goodsId,
      this.attribute,
      this.value,
      this.addTime,
      this.deleted});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    attribute = json['attribute'];
    value = json['value'];
    addTime = json['addTime'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['attribute'] = this.attribute;
    data['value'] = this.value;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    return data;
  }
}

class Brand {
  int id;
  String name;
  String desc;
  String picUrl;
  int sortOrder;
  double floorPrice;
  String addTime;
  bool deleted;
  int version;

  Brand(
      {this.id,
      this.name,
      this.desc,
      this.picUrl,
      this.sortOrder,
      this.floorPrice,
      this.addTime,
      this.deleted,
      this.version});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    picUrl = json['picUrl'];
    sortOrder = json['sortOrder'];
    floorPrice = json['floorPrice'];
    addTime = json['addTime'];
    deleted = json['deleted'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['picUrl'] = this.picUrl;
    data['sortOrder'] = this.sortOrder;
    data['floorPrice'] = this.floorPrice;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    data['version'] = this.version;
    return data;
  }
}

class ProductList {
  int id;
  int goodsId;
  List<String> specifications;
  double price;
  int number;
  String url;
  String addTime;
  bool deleted;
  int version;

  ProductList(
      {this.id,
      this.goodsId,
      this.specifications,
      this.price,
      this.number,
      this.url,
      this.addTime,
      this.deleted,
      this.version});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    specifications = json['specifications'].cast<String>();
    price = json['price'];
    number = json['number'];
    url = json['url'];
    addTime = json['addTime'];
    deleted = json['deleted'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['specifications'] = this.specifications;
    data['price'] = this.price;
    data['number'] = this.number;
    data['url'] = this.url;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    data['version'] = this.version;
    return data;
  }
}

class Info {
  int id;
  String goodsSn;
  String name;
  int categoryId;
  int brandId;
  List<String> gallery;
  String keywords;
  String brief;
  bool isOnSale;
  int sortOrder;
  String picUrl;
  String shareUrl;
  bool isNew;
  bool isHot;
  String unit;
  double counterPrice;
  double retailPrice;
  String addTime;
  bool deleted;
  int version;
  String detail;

  Info(
      {this.id,
      this.goodsSn,
      this.name,
      this.categoryId,
      this.brandId,
      this.gallery,
      this.keywords,
      this.brief,
      this.isOnSale,
      this.sortOrder,
      this.picUrl,
      this.shareUrl,
      this.isNew,
      this.isHot,
      this.unit,
      this.counterPrice,
      this.retailPrice,
      this.addTime,
      this.deleted,
      this.version,
      this.detail});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsSn = json['goodsSn'];
    name = json['name'];
    categoryId = json['categoryId'];
    brandId = json['brandId'];
    gallery = json['gallery'].cast<String>();
    keywords = json['keywords'];
    brief = json['brief'];
    isOnSale = json['isOnSale'];
    sortOrder = json['sortOrder'];
    picUrl = json['picUrl'];
    shareUrl = json['shareUrl'];
    isNew = json['isNew'];
    isHot = json['isHot'];
    unit = json['unit'];
    counterPrice = json['counterPrice'];
    retailPrice = json['retailPrice'];
    addTime = json['addTime'];
    deleted = json['deleted'];
    version = json['version'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsSn'] = this.goodsSn;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['brandId'] = this.brandId;
    data['gallery'] = this.gallery;
    data['keywords'] = this.keywords;
    data['brief'] = this.brief;
    data['isOnSale'] = this.isOnSale;
    data['sortOrder'] = this.sortOrder;
    data['picUrl'] = this.picUrl;
    data['shareUrl'] = this.shareUrl;
    data['isNew'] = this.isNew;
    data['isHot'] = this.isHot;
    data['unit'] = this.unit;
    data['counterPrice'] = this.counterPrice;
    data['retailPrice'] = this.retailPrice;
    data['addTime'] = this.addTime;
    data['deleted'] = this.deleted;
    data['version'] = this.version;
    data['detail'] = this.detail;
    return data;
  }
}
