//
//  NativeAESEcript.m
//  native_plugin
//
//  Created by shumengma on 2018/12/18.
//

#import "NativeAESEcript.h"

@implementation NativeAESEcript
+(void) registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*) registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"ma.flutter/AES" binaryMessenger:[registrar messenger]];
    NativeAESEcript* instance = [[NativeAESEcript alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if ([@"encrypt" isEqualToString:call.method]) {
        int batteryLevel = [self getBatteryLevel];
        printf("const char *restrict, ...");
        result(@"90");
    } else {
        result(FlutterMethodNotImplemented);
    }
}
-(int)getBatteryLevel{
    return 90;
}

@end
