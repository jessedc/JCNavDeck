//
//  JCNavDeckContainerViewController.m
//  JCNavDeckDemo
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "JCNavDeckContainerViewController.h"
#import "UIViewController+JCNavDeckController(Private).h"

@interface JCNavDeckContainerViewController ()
@end

@implementation JCNavDeckContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark - Setters

- (void)setRootViewController:(UIViewController *)rootViewController
{
    NSParameterAssert([self isViewLoaded]); //the view must be loaded at this point

    if (_rootViewController != rootViewController)
    {
        //Standard view controller containment teardown procedure
        [_rootViewController willMoveToParentViewController:nil];
        [_rootViewController.view removeFromSuperview];
        [_rootViewController removeFromParentViewController];

        _rootViewController = rootViewController;
        //Using the private category
        _rootViewController.navDeckController = self.navDeckController;

        //Standard view controller containment setup procedure
        [self addChildViewController:_rootViewController];
        [self.view addSubview:_rootViewController.view];
        [_rootViewController didMoveToParentViewController:self];

//        [self updateViewConstraints]; //FIXME: JC - is this required
    }
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];

    UIView *rootvc = self.rootViewController.view;
    rootvc.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *views = NSDictionaryOfVariableBindings(rootvc);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[rootvc]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rootvc]|" options:0 metrics:nil views:views]];
}

@end
