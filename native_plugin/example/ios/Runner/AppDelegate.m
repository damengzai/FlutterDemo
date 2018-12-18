#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "NativeAESEcript.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    [NativeAESEcript registerWithRegistrar:[self registrarForPlugin:@"NativeAESEcript"]];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
