import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String urlPath,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(urlPath, queryParameters: query);
  }
}
