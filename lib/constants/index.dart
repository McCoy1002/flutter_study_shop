// 全局常量
class GlobalConstants {
  static const String BASE_URL = "https://meikou-api.itheima.net"; // 基础URL
  static const int TIME_OUT = 10; // 超时时间5秒
  static const String SUCCESS_CODE = "1"; // 成功状态
}

// 请求地址接口常量
class HttpConstants {
  static const String BANNER_URL = "/home/banner"; // 轮播图接口
  static const String CATEGORY_LIST = "/home/category/head"; // 分类列表接口
  static const String PRODUCT_LIST = "/hot/preference"; // 特惠推荐接口
  static const String IN_VOGUE_LIST = "/hot/inVogue"; // 热榜推荐地址
  static const String ONE_STOP_LIST = "/hot/oneStop"; // 一站式推荐地址
  static const String RECOMMEND_LIST = "/home/recommend"; // 推荐列表
}
