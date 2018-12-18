import 'package:native_plugin/native_plugin.dart';

///AES加密
class AES {
  static Future<String> encrype(String sSrc) {
    return NativePlugin.aesEncrypt(sSrc);
  }
}
