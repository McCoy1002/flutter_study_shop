import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    // 使用SliverPadding添加左右内边距
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10), // 左右各10像素内边距
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        // itemCount: 20, // 添加商品数量
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text("更多商品$index", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
