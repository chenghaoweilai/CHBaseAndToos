//
//  main.m
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/18.
//

#import <UIKit/UIKit.h>
#import "CHAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([CHAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
