import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service for secure storage of sensitive data like tokens.
///
/// Allows configuring storage keys for different apps.
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    IOSOptions iosOptions = const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  }) : _storage = FlutterSecureStorage(
          aOptions: androidOptions,
          iOptions: iosOptions,
        );

  /// Write a value to secure storage
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a value from secure storage
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a value from secure storage
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all stored data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
