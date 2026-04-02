import 'package:dio/dio.dart';
import 'package:freezed_riverpod_clean_architecture_fast_dev/network/pretty_logger.dart';

import 'api_endpoints.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );


    dio.interceptors.add(PrettyDioLogger());
  }
}