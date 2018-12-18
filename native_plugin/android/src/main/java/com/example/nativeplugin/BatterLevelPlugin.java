package com.example.nativeplugin;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.util.Log;

import java.util.Random;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class BatterLevelPlugin implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

    public static void registerWith(PluginRegistry.Registrar registrar){
        final EventChannel eventChannel = new EventChannel(registrar.messenger(),"ma.flutter/charging");
        eventChannel.setStreamHandler(new BatterLevelPlugin());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("getBatteryLevel")) {
            Random random = new Random();
            result.success(random.nextInt(100));
        }
    }

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        BroadcastReceiver chargeStateChargeReceiver = createChargingStateChargeReceiver(eventSink);
    }

    @Override
    public void onCancel(Object o) {

    }

    private BroadcastReceiver createChargingStateChargeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "chargeing status unavaliable", null);
                    Log.e("------", "onReceive: ");
                } else {
                    boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING || status == BatteryManager.BATTERY_STATUS_FULL;
                    events.success(isCharging ? "charging" : "discharging");
                    Log.e("------", "onReceive: "+isCharging);
                }
            }
        };
    }
}
