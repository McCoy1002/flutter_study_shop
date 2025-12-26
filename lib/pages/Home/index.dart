import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图列表
  List<BannerItem> _bannerList = [];
  // 分类列表
  List<CategoryItem> _categoryList = [];
  // 特惠推荐列表
  SpecialOfferResult _specialOfferResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 热榜推荐列表
  SpecialOfferResult _inVogueResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐列表
  SpecialOfferResult _oneStopResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)), // 轮播图
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)), // 分类
      SliverToBoxAdapter(
        child: HmSuggestion(specialOfferResult: _specialOfferResult),
      ), // 推荐
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ), // 爆款
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList), // 无限滚动列表
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text("~ 没有商品了 ~", style: TextStyle(color: Colors.grey[300])),
        ),
      ), // 无限滚动列表
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialOfferList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
  }

  // 获取轮播图列表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  // 获取特惠推荐列表
  void _getSpecialOfferList() async {
    _specialOfferResult = await getSpecialOfferListAPI();
    setState(() {});
  }

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  // 获取推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
