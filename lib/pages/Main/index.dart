import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据 根据数据进行渲染4个导航
  final List<Map<String, dynamic>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  int _currentIndex = 0; // 当前选中的索引

  // 定义方法，根据数据进行渲染4个导航
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"], width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"],
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  // 定义方法，根据数据进行渲染4个导航内容
  List<Widget> _getTabBarContentWidget() {
    return [HomeView(), CategoryView(), CartView(), mineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      // 主体内容(SafeArea避开安全区组件)
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getTabBarContentWidget(),
        ),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // ignore: deprecated_member_use
        unselectedItemColor: Colors.black.withOpacity(0.5), // 未选中的颜色
        selectedItemColor: Colors.black, // 选中的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
