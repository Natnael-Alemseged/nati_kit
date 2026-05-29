import 'package:dio/dio.dart';
import 'secure_storage_service.dart';

/// Service for managing CSRF tokens globally.
class CsrfService {
  final SecureStorageService _secureStorage;
  final Dio _dio;
  final String fetchPath;
  final String storageKey;

  bool _isFetching = false;

  CsrfService({
    required Dio dio,
    required SecureStorageService secureStorage,
    this.fetchPath = '/auth/csrf-token',
    this.storageKey = 'csrf_token',
  })  : _dio = dio,
        _secureStorage = secureStorage;

  /// Ensure CSRF token is available
  Future<void> ensureCsrfToken() async {
    final existingToken = await _secureStorage.read(storageKey);
    if (existingToken != null && existingToken.isNotEmpty) {
      return;
    }

    if (_isFetching) {
      await Future.delayed(const Duration(milliseconds: 500));
      final token = await _secureStorage.read(storageKey);
      if (token != null && token.isNotEmpty) return;
    }

    _isFetching = true;
    try {
      await _fetchCsrfToken();
    } finally {
      _isFetching = false;
    }
  }

  /// Fetch CSRF token from backend
  Future<void> _fetchCsrfToken() async {
    try {
      final response = await _dio.get(
        fetchPath,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        // 1. Try body
        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          final token =
              data['csrfToken'] ?? data['csrf_token'] ?? data['token'];
          if (token != null) {
            await _secureStorage.write(storageKey, token.toString());
            return;
          }
        }

        // 2. Try cookies
        final setCookie = response.headers.value('set-cookie');
        if (setCookie != null) {
          final token = _extractCsrfTokenFromCookie(setCookie);
          if (token != null) {
            await _secureStorage.write(storageKey, token);
            return;
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  String? _extractCsrfTokenFromCookie(String cookieHeader) {
    final patterns = [
      RegExp(r'x-csrf-token=([^;]+)'),
      RegExp(r'ps-csrf-token=([^;]+)'),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(cookieHeader);
      if (match != null && match.groupCount > 0) {
        return match.group(1);
      }
    }
    return null;
  }

  Future<void> clearCsrfToken() async {
    await _secureStorage.delete(storageKey);
  }
}
