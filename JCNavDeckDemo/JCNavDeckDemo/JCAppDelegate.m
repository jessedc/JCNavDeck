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
#import "TwoViewController.h"

@implementation JCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JCNavDeckController *navDeckController = (JCNavDeckController *)self.window.rootViewController;

    OneViewController *vc1 = [[OneViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:vc1];

    TwoViewController *vc2 = [[TwoViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:vc2];


    navDeckController.viewControllers = @[navController1, navController2];

    return YES;
}

@end
