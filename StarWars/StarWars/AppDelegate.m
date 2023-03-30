//
//  AppDelegate.m
//  StarWars
//
//  Created by shweta dodiya on 2023-03-29.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
