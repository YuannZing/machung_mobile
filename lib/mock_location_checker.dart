import 'package:flutter/services.dart';

class MockLocationChecker {
  static const platform = MethodChannel('mock_location');

  static Future<bool> isMockLocation() async {
    try {
      final bool result = await platform.invokeMethod('checkMock');
      return result;
    } catch (e) {
      print('Gagal cek lokasi palsu: $e');
      return false;
    }
  }
}
