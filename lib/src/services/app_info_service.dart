import 'package:package_info_plus/package_info_plus.dart';

/// Service for accessing app version information.
class AppInfoService {
  static final AppInfoService _instance = AppInfoService._internal();
  factory AppInfoService() => _instance;
  AppInfoService._internal();

  PackageInfo? _packageInfo;
  bool _initialized = false;

  /// Initialize the service
  Future<void> initialize() async {
    if (_initialized) return;
    _packageInfo = await PackageInfo.fromPlatform();
    _initialized = true;
  }

  /// Get app version (e.g., "1.0.0")
  String get version => _packageInfo?.version ?? '0.0.0';

  /// Get build number (e.g., "1")
  String get buildNumber => _packageInfo?.buildNumber ?? '0';

  /// Get app name
  String get appName => _packageInfo?.appName ?? '';

  /// Get package name / bundle ID
  String get packageName => _packageInfo?.packageName ?? '';

  /// Get full version string (e.g., "1.0.0 (1)")
  String get fullVersion => '$version ($buildNumber)';

  /// Check if initialized
  bool get isInitialized => _initialized;
}
