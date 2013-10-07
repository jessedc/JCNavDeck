//
//  JCNavDeckController.h
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCNavDeckItem.h"

@interface JCNavDeckController : UIViewController

@property (nonatomic,copy) NSArray *viewControllers;
@property (nonatomic, weak, readonly) UIViewController *selectedViewController; //weak pointer to the selected controller, unlike tab bar controller it can't be set (yet)
@property (nonatomic, assign) NSUInteger selectedIndex;

@end

@interface UIViewController (JCNavDeckViewControllerItem)

@property (nonatomic, strong, readonly) JCNavDeckItem *navDeckItem; //unlike UITabBarController, this is readonly. I can't think of a case where you'd need to set this.
@property (nonatomic, strong, readonly) JCNavDeckController *navDeckController;

@end
