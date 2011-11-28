//
//  AppDelegate.m
//  SplitView
//
//  Created by Adar Porat on 3/27/11.
//  Copyright 2011 Kosher Penguin LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "SplitViewController.h"
#import "MasterViewController.h"
#import "DetailsViewController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AppDelegate

@synthesize window = _window;

@synthesize splitViewController = _splitViewController;
@synthesize masterNavController = _masterNavController;
@synthesize detailsNavController = _detailsNavController;
@synthesize detailsController = _detailsController;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  _window = [[UIWindow alloc] initWithFrame:TTScreenBounds()];

  if (TTIsPad()) {
    _splitViewController = [[SplitViewController alloc] initWithNibName:nil bundle:nil];
    
    TTViewController* controller = [[[MasterViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    _masterNavController = [[TTBaseNavigationController alloc] initWithRootViewController:controller];
    [_splitViewController setMasterViewController:_masterNavController];
    
    _detailsController = [[DetailsViewController alloc] initWithNibName:nil bundle:nil];
   _detailsNavController = [[TTBaseNavigationController alloc] initWithRootViewController:_detailsController];
    [_splitViewController setDetailViewController:_detailsNavController];

    _splitViewController.delegate = _detailsController;
    
    [_window addSubview:_splitViewController.view];    
  } else {
    _detailsController = [[DetailsViewController alloc] initWithNibName:nil bundle:nil];

    TTViewController* controller = [[[MasterViewController alloc] init] autorelease];
    _masterNavController = [[TTBaseNavigationController alloc] initWithRootViewController:controller];
    [_window addSubview:_masterNavController.view];    
  }
  
  [_window makeKeyAndVisible];
  
  return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {

  [super dealloc];
}

@end
