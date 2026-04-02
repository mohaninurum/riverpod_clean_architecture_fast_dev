import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'dio_error_handler.dart';
import 'api_exception.dart';

class ApiService {
  final Dio _dio = DioClient().dio;

  // ✅ GET
  Future<dynamic> get(String path,
      {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }

  // ✅ POST
  Future<dynamic> post(String path,
      {dynamic data}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }

  // ✅ PUT
  Future<dynamic> put(String path,
      {dynamic data}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }

  // ✅ DELETE
  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }
}