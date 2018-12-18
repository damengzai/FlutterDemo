package com.example.nativeplugin;

import android.util.Log;

import com.example.nativeplugin.util.AES;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class AESPlugin implements MethodChannel.MethodCallHandler {
    private static String key = "EA0CC42AC1581A06";

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "ma.flutter/AES");
        channel.setMethodCallHandler(new AESPlugin());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("encrypt")) {
            Log.e("------", "onMethodCall: " + methodCall.method + methodCall.argument("src"));
            String src = methodCall.argument("src");
            String res = AES.Encrypt(src, key);
            result.success(res);
        }
    }
}
