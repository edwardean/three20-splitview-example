//
//  AppDelegate.h
//  SplitView
//
//  Created by Adar Porat on 3/27/11.
//  Copyright 2011 Kosher Penguin LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SplitViewController;
@class DetailsViewController;

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AppDelegate : NSObject <UIApplicationDelegate> {

  UIWindow* _window;

  SplitViewController* _splitViewController;
  TTBaseNavigationController* _masterNavController;
  TTBaseNavigationController* _detailsNavController;

  DetailsViewController* _detailsController;
}

@property(nonatomic, retain) UIWindow* window;

@property(nonatomic, retain) SplitViewController* splitViewController;
@property(nonatomic, retain) TTBaseNavigationController* masterNavController;
@property(nonatomic, retain) TTBaseNavigationController* detailsNavController;
@property(nonatomic, retain) DetailsViewController* detailsController;



@end
