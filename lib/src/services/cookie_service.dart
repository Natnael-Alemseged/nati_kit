import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

/// Service for managing HTTP cookies with persistent storage.
class CookieService {
  static CookieManager? _cookieManager;
  static PersistCookieJar? _cookieJar;

  /// Initialize cookie service with persistent storage
  static Future<void> init() async {
    if (_cookieJar != null) return;

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final cookiePath = '${appDocDir.path}/cookies';
      final cookieDir = Directory(cookiePath);
      if (!await cookieDir.exists()) {
        await cookieDir.create(recursive: true);
      }
      _cookieJar = PersistCookieJar(
        storage: FileStorage(cookiePath),
      );
      _cookieManager = CookieManager(_cookieJar!);
    } catch (e) {
      // Fallback to memory-based cookie jar if file storage fails
      _cookieJar = PersistCookieJar();
      _cookieManager = CookieManager(_cookieJar!);
    }
  }

  /// Get cookie manager for Dio interceptors
  static CookieManager? get cookieManager => _cookieManager;

  /// Clear all cookies
  static Future<void> clearCookies() async {
    await _cookieJar?.deleteAll();
  }

  /// Delete cookies for a specific URI
  static Future<void> deleteCookiesForUri(Uri uri) async {
    await _cookieJar?.delete(uri);
  }
}
