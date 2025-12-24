import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

// 返回App根级组件
Widget getRootWidget() {
  return MaterialApp(
    // 初始路由
    initialRoute: "/",
    // 路由表
    routes: getRootRoutes(),
  );
}

// 根路由表
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), // 首页
    "/login": (context) => LoginPage(), // 登录页
  };
}
