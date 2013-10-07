//
//  UIViewController+JCNavDeckController(Private).h
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

//This private category which marks the navDeckController property as readwrite is used within the JCNavDeckController.
//It is not designed to be used outside of that class.

@class JCNavDeckController;

@interface UIViewController (JCNavDeckViewControllerItemPrivate)

@property (nonatomic, strong, readwrite) JCNavDeckController *navDeckController;

@end
