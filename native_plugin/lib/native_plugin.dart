import 'dart:async';

import 'package:flutter/services.dart';

class NativePlugin {
  static const MethodChannel _channel =
      const MethodChannel('native_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
