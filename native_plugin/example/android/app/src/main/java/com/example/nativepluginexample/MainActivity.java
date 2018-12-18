package com.example.nativepluginexample;

import android.os.Bundle;

import com.example.nativeplugin.AESPlugin;
import com.example.nativeplugin.BatterLevelPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    AESPlugin.registerWith(registrarFor("com.example.nativeplugin.AESPlugin"));
    BatterLevelPlugin.registerWith(registrarFor("com.example.nativeplugin.BatterLevelPlugin"));
  }
}
