// Dio请求工具类 基于Dio库封装的请求工具类

import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class Diorequest {
  final _dio = Dio(); // Dio实例
  // 构造函数
  Diorequest() {
    // 配置基础地址
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 配置拦截器
    _addInterceptors();
  }
  // 拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // 在请求发送前做一些处理
          return handler.next(request);
        },
        onResponse: (response, handler) {
          // 在响应返回前做一些处理 http状态码200 300
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            // 处理成功响应
            return handler.next(response);
          } else {
            // 处理错误响应
            return handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          // 在请求错误前做一些处理
          return handler.reject(error);
        },
      ),
    );
  }

  // get请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 进一步处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>; // 转换为Map类型
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        // 认定http状态和业务状态均正常，可以正常放行通过
        return data['result'];
      }
      // 抛出异常
      throw Exception(data['msg'] ?? "加载数据异常");
    } catch (e) {
      throw Exception(e);
    }
  }
}

// 单例对象
final Diorequest dioRequest = Diorequest();
