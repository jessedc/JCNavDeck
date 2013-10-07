//
//  JCNavDeckController.m
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "JCNavDeckController.h"
#import "UIViewController+JCNavDeckController(Private).h"
#import "JCNavDeckMenuViewController.h"

@interface JCNavDeckController ()
@property (nonatomic, strong) JCNavDeckMenuViewController *menuViewController;
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

    _selectedIndex = selectedIndex;

    if ([self isViewLoaded])
    {
        [self displayViewControllerAtIndex:_selectedIndex];
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
    //TODO: ViewController Display
}

@end
