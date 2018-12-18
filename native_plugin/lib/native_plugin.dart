import 'dart:async';

import 'package:flutter/services.dart';

class NativePlugin {
  ///调用Native方法MethodChannel
  static const MethodChannel _channel = const MethodChannel('native_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///接收Native事件
  static const EventChannel _eventChannel =
      const EventChannel('ma.flutter/charging');

  static void listenNativeEvent() {
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  static void _onEvent(Object event) {
    print("Battery status: ${event == 'charging' ? '' : 'dis'}charging");
  }

  static void _onError(Object error) {
    print('Battery status unknown');
  }

  //加密
  static const MethodChannel _methodChannel =
      const MethodChannel('ma.flutter/AES');

  static Future<String> aesEncrypt(String src) async {
    String encrypted;
    try {
      final String result =
          await _methodChannel.invokeMethod('encrypt', {'src': src});
      encrypted = result;
    } catch (e) {
      print(e);
    }
    return encrypted;
  }
}
