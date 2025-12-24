import 'package:flutter/material.dart';
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
  final List<BannerItem> _bannerList = [
    BannerItem(id: "1", imgUrl: "lib/assets/banner/1.png"),
    BannerItem(id: "2", imgUrl: "lib/assets/banner/2.png"),
    BannerItem(id: "3", imgUrl: "lib/assets/banner/3.png"),
    BannerItem(id: "4", imgUrl: "lib/assets/banner/4.png"),
  ];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)), // 轮播图
      SliverToBoxAdapter(child: HmCategory()), // 分类
      SliverToBoxAdapter(child: HmSuggestion()), // 推荐
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ), // 爆款
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(), // 更多商品列表
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
