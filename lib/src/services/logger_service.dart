import 'package:flutter/foundation.dart';

/// Log levels
enum LogLevel {
  debug,
  info,
  warning,
  error,
}

/// Service for structured logging throughout the app
class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  factory LoggerService() => _instance;
  LoggerService._internal();

  /// Log a debug message
  static void debug(String message, [String? tag]) {
    _log(LogLevel.debug, message, tag: tag);
  }

  /// Log an info message
  static void info(String message, [String? tag]) {
    _log(LogLevel.info, message, tag: tag);
  }

  /// Log a warning message
  static void warning(String message, [String? tag]) {
    _log(LogLevel.warning, message, tag: tag);
  }

  /// Log an error message
  static void error(String message,
      [Object? error, StackTrace? stackTrace, String? tag]) {
    _log(
      LogLevel.error,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Internal logging method
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      final levelStr = level.name.toUpperCase();
      final tagStr = tag != null ? '[$tag]' : '';
      final prefix = '[$timestamp] $levelStr $tagStr';

      switch (level) {
        case LogLevel.debug:
          debugPrint('$prefix $message');
          break;
        case LogLevel.info:
          debugPrint('$prefix $message');
          break;
        case LogLevel.warning:
          debugPrint('⚠️ $prefix $message');
          break;
        case LogLevel.error:
          debugPrint('❌ $prefix $message');
          if (error != null) {
            debugPrint('Error: $error');
          }
          if (stackTrace != null) {
            debugPrint('Stack trace: $stackTrace');
          }
          break;
      }
    }
  }

  /// Log API request
  static void logApiRequest(String method, String url,
      [Map<String, dynamic>? data]) {
    debug('API Request: $method $url', 'API');
    if (data != null && kDebugMode) {
      debug('Request Data: $data', 'API');
    }
  }

  /// Log API response
  static void logApiResponse(String method, String url, int statusCode,
      [dynamic data]) {
    if (statusCode >= 200 && statusCode < 300) {
      info('API Response: $method $url - $statusCode', 'API');
    } else {
      warning('API Response: $method $url - $statusCode', 'API');
    }
    if (data != null && kDebugMode) {
      debug('Response Data: $data', 'API');
    }
  }

  /// Log API error
  static void logApiError(String method, String url, Object errorObj,
      [StackTrace? stackTrace]) {
    error('API Error: $method $url', errorObj, stackTrace, 'API');
  }
}
