//
//  SplitViewAppDelegate.m
//  SplitView
//
//  Created by Hadar Porat on 7/3/11.
//  Copyright 2011 Hadar Porat. All rights reserved.
//

#import "AppDelegate.h"
#import "Three20/Three20.h"

#import "SplitViewController.h"
#import "PrimaryViewController.h"
#import "DetailsViewController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AppDelegate


@synthesize detailViewController=_detailViewController;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  TTNavigator* navigator = [TTNavigator navigator];
  navigator.persistenceMode = TTNavigatorPersistenceModeTop;
  
  TTURLMap* map = navigator.URLMap;
  
  [map from:@"*" toViewController:[TTWebController class]];
  
  _detailViewController = [[DetailsViewController alloc] init];
  
  if (TTIsPad()) {
    [map from: @"tt://primary" toSharedViewController: [SplitViewController class]];
    TTSplitViewController* controller =
    (TTSplitViewController*)[[TTNavigator navigator] viewControllerForURL:@"tt://primary"];
    
    map = controller.detailsNavigator.URLMap;
  } else {
    [map from:@"tt://primary" toViewController:[PrimaryViewController class]];
  }
  
	[map from:@"tt://details/(initWithId:)" toViewController:_detailViewController];
  
  [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://primary"]];

  
  return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  [_detailViewController release];
  [super dealloc];
}

@end
