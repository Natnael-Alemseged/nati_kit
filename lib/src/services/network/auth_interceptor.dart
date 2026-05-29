import 'package:dio/dio.dart';

/// A generic interceptor for handling authentication and tokens.
class AuthInterceptor extends Interceptor {
  final Future<String?> Function()? getAccessToken;
  final Future<String?> Function()? getCsrfToken;
  final String? userAgent;

  AuthInterceptor({
    this.getAccessToken,
    this.getCsrfToken,
    this.userAgent,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add User-Agent header
    if (userAgent != null) {
      options.headers['User-Agent'] = userAgent;
    }

    // Add access token if available
    if (getAccessToken != null) {
      final token = await getAccessToken!();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    // Add CSRF token if available
    if (getCsrfToken != null) {
      final token = await getCsrfToken!();
      if (token != null && token.isNotEmpty) {
        options.headers['x-csrf-token'] = token;
      }
    }

    handler.next(options);
  }
}
