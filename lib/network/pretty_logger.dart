import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrettyDioLogger extends Interceptor {
  void _printJson(String title, dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final pretty = encoder.convert(data);

      debugPrint('╔══════════ $title ══════════');
      debugPrint(pretty);
      debugPrint('╚════════════════════════════');
    } catch (e) {
      debugPrint('$title: $data');
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('➡️ REQUEST: ${options.method} ${options.uri}');
    if (options.data != null) {
      _printJson('Request Body', options.data);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    _printJson('Response Body', response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ ERROR: ${err.message}');
    if (err.response?.data != null) {
      _printJson('Error Response', err.response?.data);
    }
    super.onError(err, handler);
  }
}