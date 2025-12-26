import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  // 特惠推荐列表
  final SpecialOfferResult specialOfferResult;
  HmSuggestion({Key? key, required this.specialOfferResult}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  // 取前3条数据
  List<SpecialOfferGoodsItem> _getDisplayItems() {
    if (widget.specialOfferResult.subTypes.isEmpty) return [];
    return widget.specialOfferResult.subTypes.first.goodsItems.items
        .take(4)
        .toList();
  }

  // 顶部内容
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 6),
        Text(
          "精选省攻略",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  // 左侧结构
  Widget _buildLeft() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<SpecialOfferGoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                // 加载失败，返回一个新图片替换原有图片
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 60,
                  height: 70,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture,
              width: 60,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 240, 96, 12),
            ),
            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      );
    });
  }

  // 完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                // 左侧内容
                _buildLeft(),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
