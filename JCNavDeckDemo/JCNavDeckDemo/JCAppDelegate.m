//
//  JCAppDelegate.m
//  JCNavDeckDemo
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "JCAppDelegate.h"
#import "JCNavDeckController.h"

#import "OneViewController.h"

@implementation JCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JCNavDeckController *navDeckController = (JCNavDeckController *)self.window.rootViewController;

    OneViewController *vc1 = [[OneViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:vc1];

    navDeckController.viewControllers = @[navController1];

    return YES;
}

@end
