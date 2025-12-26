// 首页接口
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  // 返回请求
  return (await dioRequest.get(HttpConstants.BANNER_URL) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 分类列表接口
Future<List<CategoryItem>> getCategoryListAPI() async {
  // 返回请求
  return (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐接口
Future<SpecialOfferResult> getSpecialOfferListAPI() async {
  // 返回请求
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialOfferResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialOfferResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}
