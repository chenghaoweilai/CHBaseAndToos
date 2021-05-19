//
//  CHAppDelegate.m
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/18.
//

#import "CHAppDelegate.h"
#import "BeeHive.h"
#import "BHTimeProfiler.h"
#import <mach-o/dyld.h>
#import "BHModuleManager.h"
#import "BHServiceManager.h"
#import "CHHomeViewController.h"
#import "CHHomeViewProtocol.h"

@implementation CHAppDelegate
@synthesize window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
    [BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";//可选，默认为BeeHive.bundle/BeeHive.plist
    [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
    
    [BeeHive shareInstance].enableException = YES;
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    [[BHTimeProfiler sharedTimeProfiler] recordEventTime:@"BeeHive::super start launch"];

    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    //Protocol(功能) --- Class
    id<CHHomeViewProtocol> homeVc = [[BeeHive shareInstance] createService:@protocol(CHHomeViewProtocol)];

    if ([homeVc isKindOfClass:[UIViewController class]]) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)homeVc];
        
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = navCtrl;
        
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}
@end
