import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../cookie_service.dart';
import 'auth_interceptor.dart';

/// A pre-configured Dio client for the Nati Kit ecosystem.
class NatiApiClient {
  final Dio _dio;

  Dio get dio => _dio;

  NatiApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 15),
    Duration receiveTimeout = const Duration(seconds: 15),
    Duration sendTimeout = const Duration(seconds: 15),
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
    Future<String?> Function()? getAccessToken,
    Future<String?> Function()? getCsrfToken,
    String? userAgent,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            headers: {
              'Accept': 'application/json',
              if (headers != null) ...headers,
            },
          ),
        ) {
    // Add cookie manager if initialized
    if (CookieService.cookieManager != null) {
      _dio.interceptors.add(CookieService.cookieManager!);
    }

    // Add Auth Interceptor
    _dio.interceptors.add(
      AuthInterceptor(
        getAccessToken: getAccessToken,
        getCsrfToken: getCsrfToken,
        userAgent: userAgent,
      ),
    );

    // Add custom interceptors
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }

    // Add Log Interceptor in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
}
