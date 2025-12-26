import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  // 分类列表
  final List<CategoryItem> categoryList;

  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          // 从分类列表中获取分类项
          final categoryItem = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 5 - (10 + 10 / 5),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(categoryItem.picture, width: 40, height: 40),
                Text(
                  categoryItem.name,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
