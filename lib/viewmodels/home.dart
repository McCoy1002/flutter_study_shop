class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 工厂函数：从json数据中创建BannerItem对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imgUrl: json['imgUrl'] ?? "");
  }
}

// 根据JSON编写class对象和工厂转化函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  // 工厂函数：从json数据中创建CategoryItem对象
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map(
                  (item) => CategoryItem.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

// 特惠推荐 - 商品项
class SpecialOfferGoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  SpecialOfferGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  // 工厂函数：从json数据中创建SpecialOfferGoodsItem对象
  factory SpecialOfferGoodsItem.fromJson(Map<String, dynamic> json) {
    return SpecialOfferGoodsItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      desc: json['desc'],
      price: json['price'] ?? "",
      picture: json['picture'] ?? "",
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

// 特惠推荐 - 商品列表容器
class SpecialOfferGoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<SpecialOfferGoodsItem> items;
  SpecialOfferGoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  // 工厂函数：从json数据中创建SpecialOfferGoodsItems对象
  factory SpecialOfferGoodsItems.fromJson(Map<String, dynamic> json) {
    return SpecialOfferGoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map(
                  (item) => SpecialOfferGoodsItem.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList(),
    );
  }
}

// 特惠推荐 - 子类型
class SpecialOfferSubType {
  String id;
  String title;
  SpecialOfferGoodsItems goodsItems;
  SpecialOfferSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });
  // 工厂函数：从json数据中创建SpecialOfferSubType对象
  factory SpecialOfferSubType.fromJson(Map<String, dynamic> json) {
    return SpecialOfferSubType(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      goodsItems: SpecialOfferGoodsItems.fromJson(json['goodsItems'] ?? {}),
    );
  }
}

// 特惠推荐 - 结果
class SpecialOfferResult {
  String id;
  String title;
  List<SpecialOfferSubType> subTypes;
  SpecialOfferResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  // 工厂函数：从json数据中创建SpecialOfferResult对象
  factory SpecialOfferResult.fromJson(Map<String, dynamic> json) {
    return SpecialOfferResult(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      subTypes: json['subTypes'] == null
          ? []
          : (json['subTypes'] as List)
                .map(
                  (item) => SpecialOfferSubType.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList(),
    );
  }
}

class GoodDetailItem extends SpecialOfferGoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}
