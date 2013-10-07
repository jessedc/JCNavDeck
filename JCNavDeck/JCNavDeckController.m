//
//  JCNavDeckController.m
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "JCNavDeckController.h"
#import "UIViewController+JCNavDeckController(Private).h"
#import "JCNavDeckMenuViewController.h"
#import "JCNavDeckContainerViewController.h"

@interface JCNavDeckController ()
@property (nonatomic, strong) JCNavDeckMenuViewController *menuViewController;
@property (nonatomic, strong) JCNavDeckContainerViewController *containerViewController;
@end

@implementation JCNavDeckController
@dynamic selectedViewController;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self configureController];
    }
    return self;
}

- (void)configureController
{
    //set a default value that we can check below
    _selectedIndex = NSNotFound;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Setup Menu View Controller
    self.menuViewController = [[JCNavDeckMenuViewController alloc] initWithStyle:UITableViewStylePlain];
    self.menuViewController.navDeckController = self; //here's the first use of our new view controller property

    [self addChildViewController:self.menuViewController];

    UIView *menu = self.menuViewController.view;
    menu.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:menu];

    NSDictionary *views = NSDictionaryOfVariableBindings(menu);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[menu]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[menu]|" options:0 metrics:nil views:views]];

    [self.menuViewController didMoveToParentViewController:self];


    self.containerViewController = [[JCNavDeckContainerViewController alloc] initWithNibName:nil bundle:nil];
    self.containerViewController.navDeckController = self;

    [self addChildViewController:self.containerViewController];

    UIView *container = self.containerViewController.view;
    container.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:container];

    views = NSDictionaryOfVariableBindings(container);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[container]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[container]|" options:0 metrics:nil views:views]];


    if (self.selectedIndex != NSNotFound)
    {
        [self displayViewControllerAtIndex:self.selectedIndex];
        [self.menuViewController setSelectedIndex:self.selectedIndex];
    }
}

#pragma mark - Getters and Setters

- (void)setViewControllers:(NSArray *)viewControllers
{
    NSParameterAssert(viewControllers); //this will crash the app in development if viewControllers is nil.

    _viewControllers = viewControllers;

    //If the view is not loaded then menuViewController will be nil and this will be a no op
    [self.menuViewController.tableView reloadData];

    if ([_viewControllers count] > 0)
    {
        [self setSelectedIndex:0];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    NSAssert(selectedIndex < [self.viewControllers count], @"selectedIndex must be within range of self.viewController"); //this will crash in development if a bad index is set
    if (selectedIndex < [self.viewControllers count]) //in production NSAssert macros get compiled out. We want to make sure we protect this iVar from invalid input, so just refuse bad input
    {
        _selectedIndex = selectedIndex;

        if ([self isViewLoaded])
        {
            [self displayViewControllerAtIndex:_selectedIndex];
        }
    }
}

- (UIViewController *)selectedViewController
{
    if (self.selectedIndex != NSNotFound)
    {
        return self.viewControllers[self.selectedIndex];
    }
    return nil;
}


#pragma mark - Internal Methods

- (void)displayViewControllerAtIndex:(NSUInteger)index
{
    UIViewController *vc = self.viewControllers[index];
    self.containerViewController.rootViewController = vc;
}

@end
